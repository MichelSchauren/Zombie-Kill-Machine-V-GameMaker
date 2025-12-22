// Variaveis
nome = "Sala1";
max_players = 10;
pvp = false;

// Eventos
enum Server_events {
	criar_instancia,
	
}

// buffer usado para trocar dados com os clientes
server_buffer = buffer_create(1024, buffer_fixed, 1);
// Um Dicionário/map que terá os dados dos clientes conectados ao server
clients_map = ds_map_create(); // socket_id: [socket, instancia, nome]


// Criar servidor principal (TCP)
server_tcp = network_create_server(network_socket_tcp, global.porta_tcp, max_players);
// Servidor de descoberta (UDP)
server_udp = network_create_server(network_socket_udp, global.porta_udp, 1);

/* O servidor UDP serve somente para comunicar aqueles que querem entrar no servidor, 
quando outro usuario clicar em buscar server esse servidor UDP irá dizer: Ei, estou aqui! Meu nome é tal,
o IP é tal, pode entrar se quiser.
Já o TCP vai ser responsável pela comunicação durante o jogo mesmo, enviando todas os dados a todos os players
sempre que alguém se mexer, ou atirar etc.*/
