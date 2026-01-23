// atualizar inimigos
with (obj_Inimigo) {
	var _buffer = other.server_buffer;
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, buffer_u8, Events_server_client.mudar_inimigo);
	buffer_write(_buffer, buffer_string, string(id));
	buffer_write(_buffer, buffer_u16, x);
	buffer_write(_buffer, buffer_u16, y);
	buffer_write(_buffer, buffer_u8, vida);
	buffer_write(_buffer, buffer_u8, sprite_index);
	buffer_write(_buffer, buffer_u8, image_index);
	buffer_write(_buffer, buffer_s8, image_xscale);
	
	// Filtrar sockets para não mandar os dados para esse mesmo IP
	var _sockets = struct_get_names(obj_Client_tcp.outros_struct);
	f_network_send_all(_sockets, _buffer);
}

// atualizar ondas
if (!global.Tempo_pausado) {
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, Events_server_client.atualizar_ondas);
	buffer_write(server_buffer, buffer_u8, global.Onda_atual);
	buffer_write(server_buffer, buffer_f16, obj_Ondas.alpha);
	
	// Filtrar sockets para não mandar os dados para esse mesmo IP
	var _sockets = struct_get_names(obj_Client_tcp.outros_struct);
	f_network_send_all(_sockets, server_buffer);
}