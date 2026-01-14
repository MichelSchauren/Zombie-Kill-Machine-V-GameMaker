function f_network_send_all (sockets, buffer) {
	if (is_array(sockets)) {
		for (var i = 0; i < array_length(sockets); i++) {
			network_send_packet(sockets[i], buffer, buffer_tell(buffer));
		}
	} else {
		for (var i = 0; i < ds_list_size(sockets); i++) {
			network_send_packet(sockets[| i], buffer, buffer_tell(buffer));
		}
	}
}