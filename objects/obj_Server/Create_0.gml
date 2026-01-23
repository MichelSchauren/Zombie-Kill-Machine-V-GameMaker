// Variaveis
nome = global.server_nome;
max_players = global.server_jogadores;

// buffer usado para trocar dados com os clientes
server_buffer = buffer_create(1024, buffer_fixed, 1);
buff_ping = buffer_create(32, buffer_fixed, 1); // buffer do ping
// Uma Struct que terá os dados dos clientes conectados ao server
players_struct = {}; // {socket_client: [nome, x, y, vida, sprite, image_index], ...}
socket_list = ds_list_create(); // Só pra iterar

// Criar servidor principal (TCP)
server_tcp = network_create_server(network_socket_tcp, PORTA_TCP, max_players);
// Servidor de descoberta (UDP)
server_udp = network_create_server(network_socket_udp, PORTA_UDP, 1);

/* O servidor UDP serve somente para comunicar aqueles que querem entrar no servidor, 
quando outro usuario clicar em buscar server esse servidor UDP irá dizer: Ei, estou aqui! Meu nome é tal,
o IP é tal, pode entrar se quiser.
Já o TCP vai ser responsável pela comunicação durante o jogo mesmo, enviando todas os dados a todos os players
sempre que alguém se mexer, ou atirar etc.*/

criar_inimigo = function (inimigo) {
	with (inimigo) {
		var _buffer = other.server_buffer;
		buffer_seek(_buffer, buffer_seek_start, 0);
		buffer_write(_buffer, buffer_u8, Events_server_client.novo_inimigo);
		buffer_write(_buffer, buffer_string, string(id));
		buffer_write(_buffer, buffer_u16, x);
		buffer_write(_buffer, buffer_u16, y);
		buffer_write(_buffer, buffer_u8, vida_total);
		buffer_write(_buffer, buffer_u8, spr_colisao);
		buffer_write(_buffer, buffer_u8, spr_morrendo);
		buffer_write(_buffer, buffer_u8, sprite_index);
		
		var _sockets = struct_get_names(obj_Client_tcp.outros_struct);
		f_network_send_all(_sockets, _buffer);
	}
}

criar_moeda = function (moeda) {
	with (moeda) {
		var _buffer = other.server_buffer;
		buffer_seek(_buffer, buffer_seek_start, 0);
		buffer_write(_buffer, buffer_u8, Events_server_client.nova_moeda);
		buffer_write(_buffer, buffer_string, moeda_id);
		buffer_write(_buffer, buffer_u16, x);
		buffer_write(_buffer, buffer_u16, y+40);
		
		var _sockets = struct_get_names(obj_Client_tcp.outros_struct);
		f_network_send_all(_sockets, _buffer);
	}
}

inimigo_deu_dano = function (socket, dano) {
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, Events_server_client.dano_inimigo);
	buffer_write(server_buffer, buffer_u16, dano);
	network_send_packet(socket, server_buffer, buffer_get_size(server_buffer));
}

escrever_chat = function (nome, msg) {
	buffer_seek(server_buffer, buffer_seek_start, 0);
	buffer_write(server_buffer, buffer_u8, Events_server_client.novo_chat);
	buffer_write(server_buffer, buffer_string, nome);
	buffer_write(server_buffer, buffer_string, msg);
	f_network_send_all(socket_list, server_buffer);
}