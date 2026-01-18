// VARIAVEIS GLOBAIS


// configurações gerais
global.Mapa_atual = Mapa_Principal;
global.Spaw_mapa_pos = ds_list_create();
global.Moedas = 0;

// modo desenvolvedor
global.Modo_desenvolvedor = true;
global.Spaw_inimigos = true;
global.Mostrar_colisoes_inimigos = false;
global.Mostrar_colisoes_player = false;
global.Controller_mode = 0; // 0:PC; 1:GamePad; 2:Mobile;
global.second_control_mode = 1;
global.Player_imortal = false;
global.Tempo_pausado = false;

// ondas
global.Onda_atual = 0;
global.Peso_orda = 0;
global.Orda = ds_list_create();
global.Mostrar_ondas = true;
#macro TEMPO_DIA (game_get_speed(gamespeed_fps) * 60) //segundos
#macro TEMPO_NOITE (game_get_speed(gamespeed_fps) * 30)
#macro TEMPO_ORDA_DIA (game_get_speed(gamespeed_fps) * 20)
#macro TEMPO_ORDA_NOITE (game_get_speed(gamespeed_fps) * 10)
// [peso, inimigo, orda em que começa a aparecer]
#macro PESOS_ORDA [ [1, obj_Esqueleto, 1], [3, obj_Rapido, 2], [7, obj_MiniBoss, 5] ]

// player
global.Player_name = "";
global.Player_vida = 100;
#macro PLAYER_VIDA_TOTAL 100
#macro PLAYER_VEL_CORRENDO 3.4
#macro PLAYER_VEL_ATIRANDO 2.4

// tiro
#macro TIRO_VEL 10
#macro TIRO_TPS 3 // Tiros por segundo
#macro TIRO_DANO 8

// esqueleto
#macro ESQUELETO_ALCANCE_CORPO 60
#macro ESQUELETO_VIDA_TOTAL 50
#macro ESQUELETO_VEL 1.8
#macro ESQUELETO_DANO 18

// rapido
#macro RAPIDO_ALCANCE_CORPO 100
#macro RAPIDO_VIDA_TOTAL 40
#macro RAPIDO_VEL 3
#macro RAPIDO_DASH_VEL 7
#macro RAPIDO_DANO 16

// mini boss
#macro MINIBOSS_ALCENCE_CORPO 60
#macro MINIBOSS_ALCENCE_ATIRANDO 360
#macro MINIBOSS_VIDA_TOTAL 80
#macro MINIBOSS_VEL 1.2
#macro MINIBOSS_DANO_CORPO 20
#macro MAXADO_DANO 25
#macro MAXADO_VEL 8


// MULTIPLAYER
#macro PORTA_TCP 64193
#macro PORTA_UDP 64194
global.Multiplayer = false;
global.Multiplayer_adm = false;
global.conect_server_ip = noone;
global.input_server_nome = noone;
global.input_server_jogadores = noone;
global.server_nome = $"Sala{int64(random_range(10, 99))}";
global.server_jogadores = 10;
global.server_pvp = noone;

global.Mostrar_chat = false;
global.Chat_mensagens = ds_list_create();

// Eventos multiplayer
enum Events_client_server {
	dados_player = 10, // cliente envia infos sobre seu player (nome, x, y) >
	mudar_player, // sempre que o player do cliente tiver alguma alteração ele envia os dados ao servidor >
	tiro_player, // sempre que o player do cliente der um TIRO, ele evia isso ao servidor >
	enviar_chat, // player envia uma mensagem no chat >
	ver_ping // Cliente envia um pacote ao servidor apenas para verificar a latencia e atualizar o ping >
}
enum Events_server_client {
	dados_outros = 100, // servidor retorna uma lista de todos os clientes menos esse <
	novo_cliente, // servidor informa a todos os outros clientes que um novo cliente entrou <<
	mudar_outro, // o servidor recebe os dados e informa a todos os outros que tal cliente foi alterado <<
	novo_projetil, // o servidor manda todos os clientes criar tal projetil em tal posição <<
	novo_inimigo, // o servidor avisa os clientes que um inimigo apareceu <<
	mudar_inimigo, // servidor atualiza a todos sobre os status do inimigo <<
	dano_inimigo, // Avisar a determinado cliente que seu player tomou um dano do inimigo <
	atualizar_ondas, // enviar o numero da onda e o alpha da escuridao da noite <<
	novo_chat, // o servidor avisa todos os clientes que há uma nova mensagem no chat <<
	outro_desconectado, // o servidor avisa todos os clientes que tal cliente foi desconectado <<
	atualizar_ping, // servidor devolve a msg ao cliente para ele calcular o ping <
	server_desligado // o servidor avisa todos os clientes que ele foi desligado <<
}
