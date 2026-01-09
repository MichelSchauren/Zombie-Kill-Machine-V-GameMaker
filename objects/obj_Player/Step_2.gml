// Se estiver no modo online
if (room == Multiplayer) {
	// Dizer ao servidor o estado atual do player
	// x, y, vida, sprite, image_index.
	_buffer = obj_Client_tcp.client_buffer;
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, buffer_u8, Events_client_server.mudar_player);
	buffer_write(_buffer, buffer_u16, x);
	buffer_write(_buffer, buffer_u16, y);
	buffer_write(_buffer, buffer_u8, vida);
	buffer_write(_buffer, buffer_u8, sprite_index);
	buffer_write(_buffer, buffer_u8, image_index);
	buffer_write(_buffer, buffer_f16, image_xscale);
	network_send_packet(obj_Client_tcp.socket_tcp, _buffer, buffer_tell(_buffer));
}
