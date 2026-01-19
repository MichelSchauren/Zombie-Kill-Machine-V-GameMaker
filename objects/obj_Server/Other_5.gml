// Avisar clientes sobre o desligamento do server
buffer_seek(server_buffer, buffer_seek_start, 0);
buffer_write(server_buffer, buffer_u8, Events_server_client.server_desligado);
f_network_send_all(socket_list, server_buffer);

instance_destroy();

buffer_delete(server_buffer);
buffer_delete(buff_ping);

network_destroy(server_tcp);
network_destroy(server_udp);