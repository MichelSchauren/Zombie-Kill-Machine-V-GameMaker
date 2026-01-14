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