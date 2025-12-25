// Socket
socket_tcp = network_create_socket(network_socket_tcp);

// buffer usado para trocar dados com o servidor
client_buffer = buffer_create(1024, buffer_fixed, 1);
// Uma Struct que terá os dados dos clientes conectados ao server
outros_struct = {};

// Tentar se conectar ao servidor
var _conected = network_connect(socket_tcp, global.conect_server_ip, global.porta_tcp);
if (_conected < 0) { // Não deu certo!
	show_message(@"
	Algo deu errado! Não foi possivel conectar-se ao servidor.
	Verifique sua conexão e tente novamente!"
	);
	network_destroy(socket_tcp);
	buffer_delete(client_buffer);
	global.conect_server_ip = noone;
	instance_destroy();
	
} else { // Deu certo!
	room_goto(Multiplayer);
	ping = 0;
	buff_ping = buffer_create(32, buffer_fixed, 1);
	alarm[0] = fps;
	alarm[1] = fps*10;
}