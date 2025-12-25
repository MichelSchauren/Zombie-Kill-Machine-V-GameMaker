function f_Escrever_chat(nome, msg){
	var _buffer = obj_Server.server_buffer;
	var _socket = obj_Server.server_tcp;
	
	buffer_seek(_buffer, buffer_seek_start, 0);
	buffer_write(_buffer, buffer_u8, Events_server_client.novo_chat);
	buffer_write(_buffer, buffer_string, nome);
	buffer_write(_buffer, buffer_string, msg);
	f_network_send_all(obj_Server.socket_list, _buffer);
}