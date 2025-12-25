// Controle de ping
buffer_seek(buff_ping, buffer_seek_start, 0);
buffer_write(buff_ping, buffer_u8, Events_client_server.ver_ping);
buffer_write(buff_ping, buffer_u32, current_time);
network_send_packet(socket_tcp, buff_ping, buffer_get_size(buff_ping));

alarm[0] = fps;