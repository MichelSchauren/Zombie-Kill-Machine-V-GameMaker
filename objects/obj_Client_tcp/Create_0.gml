// Socket
socket_tcp = network_create_socket(network_socket_tcp);

// buffer usado para trocar dados com o servidor
client_buffer = buffer_create(1024, buffer_fixed, 1);

// Tentar se conectar ao servidor
var _conected = network_connect(socket_tcp, global.conect_server_ip, PORTA_TCP);
if (_conected < 0) { // Não deu certo!
	show_message(@"
	Algo deu errado! Não foi possivel conectar-se ao servidor.
	Verifique sua conexão e tente novamente!"
	);
	instance_destroy();
	room_goto(Menu_Multiplayer);
	
} else { // Deu certo!
	ping = 0;
	buff_ping = buffer_create(32, buffer_fixed, 1);
	alarm[0] = fps;
	alarm[1] = fps*10;
}


// Uma Struct que terá os dados dos clientes conectados ao server
outros_struct = {};
// Uma Struct que terá os dados dos inimigos
inimigos_struct = {};
// Uma Struct que terá os dados dos tiros
tiros_struct = {};
// Uma Struct que terá os dados das moedas
moedas_struct = {};


// PLAYER
// cliente envia infos sobre seu player para o servidor (nome, x, y)
with (obj_Player) {
	// Posição aleatória dentro do spaw no multiplayer
	x = int64(random_range(global.Spaw_mapa_pos[| 1], global.Spaw_mapa_pos[| 3]));
	y = int64(random_range(global.Spaw_mapa_pos[| 0], global.Spaw_mapa_pos[| 2]));
	
	// Enviar dados
	var _buffer = other.client_buffer;
	buffer_seek(_buffer, buffer_seek_start, 0); // Ir para início do buffer
	buffer_write(_buffer, buffer_u8, Events_client_server.dados_player);
	buffer_write(_buffer, buffer_string, global.Player_name); // Meu Nome
	buffer_write(_buffer, buffer_u16, x); // Cordenada X do player
	buffer_write(_buffer, buffer_u16, y); // Cordenada Y do player
	network_send_packet(other.socket_tcp, _buffer, buffer_tell(_buffer));
}


coletei_moeda = function (moeda_id) {
	buffer_seek(client_buffer, buffer_seek_start, 0); // Ir para início do buffer
	buffer_write(client_buffer, buffer_u8, Events_client_server.coletei_moeda);
	buffer_write(client_buffer, buffer_string, moeda_id); // ID da moeda que coletei
	network_send_packet(socket_tcp, client_buffer, buffer_tell(client_buffer));
}