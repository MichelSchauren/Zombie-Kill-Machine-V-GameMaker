pvp = global.Multiplayer and global.server_pvp;

server_criar_proj = function () {
	var _buffer = obj_Server.server_buffer;
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, buffer_u8, Events_server_client.novo_projetil);
	buffer_write(_buffer, buffer_u16, object_index);
	buffer_write(_buffer, buffer_u16, x);
	buffer_write(_buffer, buffer_u16, y);
	buffer_write(_buffer, buffer_u16, direction);
	
	var _sockets = struct_get_names(obj_Client_tcp.outros_struct);
	f_network_send_all(_sockets, _buffer);
}

alarm[0] = 1;

event_user(0);