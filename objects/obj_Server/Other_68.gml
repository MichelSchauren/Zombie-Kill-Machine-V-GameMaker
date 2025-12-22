// Async - Networking (Servidor)
var _socket_id = async_load[? "id"]; // id do socket
var _type_event = async_load[? "type"]; // tipo de evento do cliente
var _socket = async_load[? "socket"]; // pegar socket
var _buffer = async_load[? "buffer"]; // buffer/dados enviado pelo cliente

// --- 1. VERIFICAÇÃO DO SOCKET UDP DE DESCOBERTA ---
if (_socket_id == server_udp) {
	// O socket UDP só vai gerar eventos do tipo network_type_data
    if (_type_event == network_type_data) {
		var _client_ip = async_load[? "ip"];
        var _client_port = async_load[? "port"];
        
        // 1. Cria o buffer de resposta
        var _response = buffer_create(128, buffer_fixed, 1);
        buffer_write(_response, buffer_u8, 0x02); // Código de Resposta
        buffer_write(_response, buffer_string, global.server_nome); // Nome do servidor
        buffer_write(_response, buffer_u16, porta_tcp); // Porta TCP
        buffer_write(_response, buffer_string, $"{ds_list_size(socket_list)+1}/{global.server_max_players}"); // Quant. de jogadores
        
        // 2. Envia a resposta diretamente ao IP/porta do cliente (via UDP)
        network_send_udp(global.server_descoberta_udp, _client_ip, _client_port, _response, buffer_get_size(_response));
        
        buffer_delete(_response);
	}
}
// --- 2. VERIFICAÇÃO DO SOCKET TCP PRINCIPAL (JOGO) ---
else {
    switch (_type_event) {
		// Cliente se conectou ao servidor
		case network_type_connect:
			f_Escrever_chat("Servidor", "Cliente conectado!");
			ds_map_add(obj_Server.clients_map, _socket, array_create(3, noone));
			array_set(clients_map[? _socket], 0, _socket_id);
			break;
	
		// Cliente desconectou do servidor
		case network_type_disconnect:
			f_Escrever_chat("Servidor", "Cliente desconectado!");
			ds_map_destroy(_socket);
			break;
	
		// Cliente enviou dados
		case network_type_data:
			buffer_seek(_buffer, buffer_seek_start, 0); // ir para o início do buffer
			var msg_id = buffer_read(_buffer, buffer_u8); // ID da mensagem
			
			// Oque será feito com os dados recebidos
			switch(msg_id) {
				case Server_events.criar_instancia:
					// Criar instancia do novo player
					var _nome = buffer_read(_buffer, buffer_string);
					var _x = buffer_read(_buffer, buffer_u16);
					var _y = buffer_read(_buffer, buffer_u16);
					var _instance = instance_create_layer(_x, _y, "Personagens", obj_Outro);
					_instance.nome = _nome;
					
					array_set(clients_map[? _socket_id], 1, _instance);
					array_set(clients_map[? _socket_id], 2, _nome);
					
					break;
			}
			
			break;
	}
}