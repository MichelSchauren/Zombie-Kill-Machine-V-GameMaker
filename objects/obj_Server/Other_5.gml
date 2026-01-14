instance_destroy();

buffer_delete(server_buffer);
buffer_delete(buff_ping);

network_destroy(server_tcp);
network_destroy(server_udp);