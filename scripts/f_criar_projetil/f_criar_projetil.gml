function f_criar_projetil(x, y, obj, params) {
	// função que cria um projetil tanto no modo solo quanto multiplayer
	if (global.Multiplayer) {
		var _buffer;
		if (global.Multiplayer_adm) {
			_buffer = obj_Server.server_buffer;
			buffer_seek(_buffer, buffer_seek_start, 0);
			buffer_write(_buffer, buffer_u8, Events_server_client.novo_projetil);
			buffer_write(_buffer, buffer_u16, obj);
			buffer_write(_buffer, buffer_u16, x);
			buffer_write(_buffer, buffer_u16, y);
			buffer_write(_buffer, buffer_string, json_stringify(params));
	
			f_network_send_all(obj_Server.socket_list, _buffer);
		} else {
			_buffer = obj_Client_tcp.client_buffer;
			buffer_seek(_buffer, buffer_seek_start, 0);
			buffer_write(_buffer, buffer_u8, Events_client_server.atirei_proj);
			buffer_write(_buffer, buffer_u16, obj);
			buffer_write(_buffer, buffer_u16, x);
			buffer_write(_buffer, buffer_u16, y);
			buffer_write(_buffer, buffer_string, json_stringify(params));
	
			network_send_packet(obj_Client_tcp.socket_tcp, _buffer, buffer_tell(_buffer));
		}
		
	} else {
		instance_create_layer(x, y, "Projeteis", obj, params);
	}
}