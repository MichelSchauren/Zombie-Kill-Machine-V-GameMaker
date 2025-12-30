function f_network_send_all(socket_list, buffer) {
	for (var i = 0; i < ds_list_size(socket_list); i++) {
		network_send_packet(socket_list[| i], buffer, buffer_tell(buffer));
	}
}