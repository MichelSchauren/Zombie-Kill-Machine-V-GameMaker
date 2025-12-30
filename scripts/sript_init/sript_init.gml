// VARIAVEIS GLOBAIS

global.Player_name = "";
global.Player_vida = 100;
global.Inimigos_spaw_limit = 10;

// modo desenvolvedor
global.Modo_desenvolvedor = true;
global.Spaw_inimigos = true;
global.Mostrar_colisoes_inimigos = false;
global.Mostrar_colisoes_player = false;


// CONSTANTES GLOBAIS

// player
global.Player_VIDA_TOTAL = 100;
global.Player_VEL_CORRENDO = 2.2;
global.Player_VEL_ATIRANDO = 1.4;
// tiro
global.Tiro_VEL = 10;
global.Tiro_TPS = 3; // Tiros por segundo
global.Tiro_DANO = 8;
// esqueleto
global.Esqueleto_VIDA_TOTAL = 50;
global.Esqueleto_VEL = 1.8;
global.Esqueleto_DANO = 19;

// MULTIPLAYER
global.porta_tcp = 64193;
global.porta_udp = 64194;
global.conect_server_ip = noone;
global.server_nome = $"Sala{int64(random_range(10, 99))}";
global.server_jogadores = 10;
global.server_pvp = noone;
// Eventos
enum Events_client_server {
	dados_player = 10, // cliente envia infos sobre seu player (nome, x, y) >
	mudar_player, // sempre que o player do cliente tiver alguma alteração ele envia os dados ao servidor >
	tiro_player, // sempre que o player do cliente der um TIRO, ele evia isso ao servidor >
	enviar_chat, // player envia uma mensagem no chat
	ver_ping // Cliente envia um pacote ao servidor apenas para verificar a latencia e atualizar o ping
}
enum Events_server_client {
	dados_outros = 100, // servidor retorna uma lista de todos os clientes menos esse <
	novo_cliente, // servidor informa a todos os outros clientes que um novo cliente entrou <<
	mudar_outro, // o servidor recebe os dados e informa a todos os outros que tal cliente foi alterado <<
	novo_tiro, // o servidor manda todos os clientes criar um tiro em tal posição <<
	novo_chat, // o servidor avisa todos os clientes que há uma nova mensagem no chat <<
	outro_desconectado, // o servidor avisa todos os clientes que tal cliente foi desconectado <<
	atualizar_ping, // servidor devolve a msg ao cliente para ele calcular o ping <
	server_desligado // o servidor avisa todos os clientes que ele foi desligado <<
}


// Isso faz o código interpretar as 2 teclas da mesma forma 
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);