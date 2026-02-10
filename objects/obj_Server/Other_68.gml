// Async - Networking (Servidor)
var _socket_id = async_load[? "id"]; // id do socket que disparou o evento
var _type_event = async_load[? "type"]; // tipo de evento do cliente
var _socket = async_load[? "socket"]; // o socket que se conectou ou desconectou do server (connect/desconnect)
var _buffer = async_load[? "buffer"]; // buffer/dados enviado pelo cliente

// --- 1. VERIFICAÇÃO DO SOCKET UDP DE DESCOBERTA ---
if (_socket_id == server_udp) {
	// O socket UDP só vai gerar eventos do tipo network_type_data
    if (_type_event == network_type_data) {
		var _client_ip = async_load[? "ip"];
        var _client_port = async_load[? "port"];
        
        // Cria o buffer de resposta
        var _response = buffer_create(128, buffer_fixed, 1);
        buffer_write(_response, buffer_u8, 0x02); // Código de Resposta
        buffer_write(_response, buffer_string, nome); // Nome do servidor
        buffer_write(_response, buffer_string, $"{ds_list_size(socket_list)}/{max_players}"); // Quant. de jogadores
		buffer_write(_response, buffer_u8, global.server_pvp); // PVP ativo?
		buffer_write(_response, buffer_string, GM_version); // Versão do servidor
        
        // Envia a resposta diretamente ao IP/porta do cliente (via UDP)
        network_send_udp(server_udp, _client_ip, _client_port, _response, buffer_get_size(_response));
        
        buffer_delete(_response);
	}
}
// --- 2. VERIFICAÇÃO DO SOCKET TCP PRINCIPAL (JOGO) ---
else {
    switch (_type_event) {	
		// Cliente desconectou do servidor
		case network_type_disconnect:
			// Remove cliente do struct
			if (struct_exists(players_struct, _socket)) {
				escrever_chat("Servidor", $"{players_struct[$ _socket][0]} desconectou!");
				struct_remove(players_struct, _socket);
			}
			var _pos = ds_list_find_index(socket_list, _socket);
			ds_list_delete(socket_list, _pos); // Remove socket da lista
			
			// Avisar aos outros clientes que esse aqui desconectou
			buffer_seek(server_buffer, buffer_seek_start, 0);
			buffer_write(server_buffer, buffer_u8, Events_server_client.outro_desconectado);
			buffer_write(server_buffer, buffer_u8, _socket);
			f_network_send_all(socket_list, server_buffer);
			
			break;
	
		// Cliente enviou dados
		case network_type_data:
			buffer_seek(_buffer, buffer_seek_start, 0); // ir para o início do buffer
			var msg_id = buffer_read(_buffer, buffer_u8); // ID da mensagem
			
			// Oque será feito com os dados recebidos
			switch(msg_id) {
				case Events_client_server.dados_player:
					// Interpretar dados
					var _nome = buffer_read(_buffer, buffer_string);
					var _x = buffer_read(_buffer, buffer_u16);
					var _y = buffer_read(_buffer, buffer_u16);
					var _array_player = [_nome, _x, _y, PLAYER_VIDA_TOTAL, spr_Player_parado, 0, 1];
					
					// servidor informa o cliente sobre os inimigos já spawnados <
					for (var i=0; i < instance_number(obj_Inimigo); i++) {
						var _inimigo = instance_find(obj_Inimigo, i);
						with (_inimigo) {
							var _sbuff = other.server_buffer;
							buffer_seek(_sbuff, buffer_seek_start, 0);
							buffer_write(_sbuff, buffer_u8, Events_server_client.novo_inimigo);
							buffer_write(_sbuff, buffer_string, string(id));
							buffer_write(_sbuff, buffer_u16, x);
							buffer_write(_sbuff, buffer_u16, y);
							buffer_write(_sbuff, buffer_u8, vida_total);
							buffer_write(_sbuff, buffer_u8, spr_colisao);
							buffer_write(_sbuff, buffer_u8, spr_morrendo);
							buffer_write(_sbuff, buffer_u8, sprite_index);
							network_send_packet(_socket_id, _sbuff, buffer_get_size(_sbuff))
						}
					}
				
					// servidor retorna a struct de todos os clientes menos esse <
					if (struct_names_count(players_struct) > 0) {
						var _struct_json = json_stringify(players_struct);
						buffer_seek(server_buffer, buffer_seek_start, 0);
						buffer_write(server_buffer, buffer_u8, Events_server_client.dados_outros);
						buffer_write(server_buffer, buffer_string, _struct_json);
						network_send_packet(_socket_id, server_buffer, buffer_get_size(server_buffer));
					}
					
					// servidor informa a todos os outros clientes que um novo cliente entrou <<
					buffer_seek(server_buffer, buffer_seek_start, 0);
					buffer_write(server_buffer, buffer_u8, Events_server_client.novo_cliente);
					buffer_write(server_buffer, buffer_u8, _socket_id);
					buffer_write(server_buffer, buffer_string, json_stringify(_array_player));
					f_network_send_all(socket_list, server_buffer);
					
					// Guardar dados do novo player
					ds_list_add(socket_list, _socket_id);
					players_struct[$ _socket_id] = _array_player;
					// { socket_client: [nome, x, y, vida, sprite, image_index] }
					
					escrever_chat("Servidor", $"[{_nome}] se conectou!");
					
					break;
					
				case Events_client_server.mudar_player:
					// Atualizar dados desse cliente
					players_struct[$ _socket_id][1] = buffer_read(_buffer, buffer_u16);
					players_struct[$ _socket_id][2] = buffer_read(_buffer, buffer_u16);
					players_struct[$ _socket_id][3] = buffer_read(_buffer, buffer_u8);
					players_struct[$ _socket_id][4] = buffer_read(_buffer, buffer_u8);
					players_struct[$ _socket_id][5] = buffer_read(_buffer, buffer_u8);
					players_struct[$ _socket_id][6] = buffer_read(_buffer, buffer_s8);
					
					// Mandar isso para os outros clientes
					// filtrar pra não envia para esse socket tmb
					var _list_outros = f_filtrar_list_v(socket_list, _socket_id);
					// Enviar
					buffer_seek(server_buffer, buffer_seek_start, 0);
					buffer_write(server_buffer, buffer_u8, Events_server_client.mudar_outro); // codigo
					buffer_write(server_buffer, buffer_u8, _socket_id); // socket do cliente que mudou
					buffer_write(server_buffer, buffer_u16, players_struct[$ _socket_id][1]);
					buffer_write(server_buffer, buffer_u16, players_struct[$ _socket_id][2]);
					buffer_write(server_buffer, buffer_u8, players_struct[$ _socket_id][3]);
					buffer_write(server_buffer, buffer_u8, players_struct[$ _socket_id][4]);
					buffer_write(server_buffer, buffer_u8, players_struct[$ _socket_id][5]);
					buffer_write(server_buffer, buffer_s8, players_struct[$ _socket_id][6]);
					f_network_send_all(_list_outros, server_buffer);
					
					break;
					
				case Events_client_server.tiro_player:
					// Ler informações do tiro solicitado
					var _tiro_x = buffer_read(_buffer, buffer_u16);
					var _tiro_y = buffer_read(_buffer, buffer_u16);
					var _tiro_dir = buffer_read(_buffer, buffer_u16);
					
					// Escrever buffer do novo projetil (TIRO)
					buffer_seek(server_buffer, buffer_seek_start, 0);
					buffer_write(server_buffer, buffer_u8, Events_server_client.novo_projetil);
					buffer_write(server_buffer, buffer_u16, obj_Tiro);
					buffer_write(server_buffer, buffer_u16, _tiro_x);
					buffer_write(server_buffer, buffer_u16, _tiro_y);
					buffer_write(server_buffer, buffer_u16, _tiro_dir);
					// Enviar buffer a todos
					f_network_send_all(socket_list, server_buffer);
					
					break;
					
				case Events_client_server.ver_ping:
					var _current_time = buffer_read(_buffer, buffer_u32);
					buffer_seek(buff_ping, buffer_seek_start, 0);
					buffer_write(buff_ping, buffer_u8, Events_server_client.atualizar_ping);
					buffer_write(buff_ping, buffer_u32, _current_time);
					network_send_packet(_socket_id, buff_ping, buffer_get_size(buff_ping));
					
					break;
					
				case Events_client_server.coletei_moeda:
					var _id_coin = buffer_read(_buffer, buffer_string);
					
					buffer_seek(server_buffer, buffer_seek_start, 0);
					buffer_write(server_buffer, buffer_u8, Events_server_client.moeda_coletada);
					buffer_write(server_buffer, buffer_string, _id_coin);
					f_network_send_all(socket_list, server_buffer);
					
					break;
			}
			
			break;
	}
}