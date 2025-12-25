if (room == Multiplayer) {
	network_destroy(socket_tcp);
	buffer_delete(client_buffer);
	global.conect_server_ip = noone;
	instance_destroy();
}