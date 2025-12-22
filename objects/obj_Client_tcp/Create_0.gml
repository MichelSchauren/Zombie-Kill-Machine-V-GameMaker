// Socket
socket_tcp = network_create_socket(network_socket_tcp);

// Eventos / Respostas do servidor
enum Client_events {
	atualizar_clients_map
}

// buffer usado para trocar dados com o servidor
client_buffer = buffer_create(1024, buffer_fixed, 1);
// Um Dicionário/map que terá os dados dos clientes conectados ao server
clients_map = ds_map_create();

// Tentar se conectar ao servidor
var _conected = network_connect(socket_tcp, global.conect_server_ip, global.porta_tcp);
if (_conected < 0) { // Não deu certo!
	show_message(@"
	Algo deu errado! Não foi possivel conectar-se ao servidor.
	Verifique sua conexão e tente novamente!"
	);
} else { // Deu certo!
	room_goto(Multiplayer);
}

