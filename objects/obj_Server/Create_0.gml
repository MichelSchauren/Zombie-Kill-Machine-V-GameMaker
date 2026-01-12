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
