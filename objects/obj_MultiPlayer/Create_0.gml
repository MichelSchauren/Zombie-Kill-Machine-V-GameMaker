if (global.Multiplayer) {
	global.Spaw_inimigos = false;
	global.Mostrar_ondas = false;
	global.Mostrar_chat = true;
	global.Tempo_pausado = true;
	

	global.conect_server_ip = "127.0.0.1"; // Definir o IP como local
	// Criar servidor
	instance_create_layer(0, 0, "Abstratos", obj_Server);
	// Criar cliente e conectar ele ao servidor com o IP local
	instance_create_layer(0, 0, "Abstratos", obj_Client_tcp);
	
	
	// PLAYER
	// cliente envia infos sobre seu player para o servidor (nome, x, y)
	with (obj_Player) {
		// Posição aleatória no multiplayer
		x = int64(random_range(1250, 1800));
		y = int64(random_range(1450, 1540));
	
		// Enviar dados
		var _buffer = obj_Client_tcp.client_buffer;
		buffer_seek(_buffer, buffer_seek_start, 0); // Ir para início do buffer
		buffer_write(_buffer, buffer_u8, Events_client_server.dados_player);
		buffer_write(_buffer, buffer_string, global.Player_name); // Meu Nome
		buffer_write(_buffer, buffer_u16, x); // Cordenada X do player
		buffer_write(_buffer, buffer_u16, y); // Cordenada Y do player
		network_send_packet(obj_Client_tcp.socket_tcp, _buffer, buffer_tell(_buffer));
	}
}
