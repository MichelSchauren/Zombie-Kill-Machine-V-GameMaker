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

// player
global.Player_name = "";
global.Player_vida = 100;
#macro PLAYER_VIDA_TOTAL 100
#macro PLAYER_VEL_CORRENDO 204
#macro PLAYER_VEL_ATIRANDO 144

// inimigos {"peso": peso de orda, "orda": orda em que começa a aparecer, "obj": objeto do inimigo,
// "vel": velocidade, "dano": dano, "vida": vida total, "alcance": alcance corpo a corpo, ...}
#macro ZOMBI {"peso": 1, "orda": 1, "obj": obj_Zombi, "vel": 108, "dano": 14, "vida": 32, "alcance": 54}
#macro ZOMBIGIRL {"peso": 1, "orda": 2, "obj": obj_ZombiGirl, "vel": 102, "dano": 13, "vida": 38, "alcance": 52}
#macro TANQUE {"peso": 3, "orda": 3, "obj": obj_Tanque, "vel": 90, "dano": 17, "vida": 50, "alcance": 58}
#macro RAPIDO {"peso": 4, "orda": 4, "obj": obj_Rapido, "vel": 180, "dano": 15, "vida": 30, "alcance": 100, "dash_vel": 7}
#macro MINIBOSS {"peso": 10, "orda": 5, "obj": obj_MiniBoss, "vel": 72, "dano": 24, "vida": 120, "alcance": 60, "alcance_atirando": 360}

#macro INIMIGOS [ZOMBI, ZOMBIGIRL, TANQUE, RAPIDO, MINIBOSS]

// projeteis {"vel", "dano", ...}
#macro TIRO {"vel": 720, "dano": 8, "tps": 4}
#macro MAXADO {"vel": 580, "dano": 28}

// torres
#macro TORRE_ARQUEIRA [ \
	{vida: 500, altura: 130, alcance: 500, vel: 660, dano: 6, tx: 1}, \
	{vida: 600, altura: 170, alcance: 650, vel: 670, dano: 7, tx: 1.2}, \
	{vida: 700, altura: 200, alcance: 800, vel: 680, dano: 8, tx: 1.4}, \
	{vida: 800, altura: 240, alcance: 1050, vel: 690, dano: 9, tx: 1.6}, \
	{vida: 900, altura: 260, alcance: 1200, vel: 700, dano: 10, tx: 1.8} \
]

// ondas
global.Onda_atual = 0;
global.Peso_orda = 0;
global.Orda = ds_list_create();
global.Mostrar_ondas = true;
#macro TEMPO_DIA (game_get_speed(gamespeed_fps) * 60) //segundos
#macro TEMPO_NOITE (game_get_speed(gamespeed_fps) * 30)
#macro TEMPO_ORDA_DIA (game_get_speed(gamespeed_fps) * 20)
#macro TEMPO_ORDA_NOITE (game_get_speed(gamespeed_fps) * 10)


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
	coletei_moeda, // avisar servidor de que seu player coletou tal moeda >
	enviar_chat, // player envia uma mensagem no chat >
	ver_ping // Cliente envia um pacote ao servidor apenas para verificar a latencia e atualizar o ping >
}
enum Events_server_client {
	dados_outros = 100, // servidor retorna uma lista de todos os clientes menos esse <
	novo_cliente, // servidor informa a todos os outros clientes que um novo cliente entrou <<
	mudar_outro, // o servidor recebe os dados e informa a todos os outros que tal cliente foi alterado <<
	novo_projetil, // o servidor manda todos os clientes criar tal projetil em tal posição <<
	novo_inimigo, // o servidor avisa os clientes que um inimigo apareceu <<
	nova_moeda, // servidor avisa sobre o surgimento de uma nova moeda no mapa <<
	moeda_coletada, // servidor avisa a todos que alguem coletou tal moeda <<
	mudar_inimigo, // servidor atualiza a todos sobre os status do inimigo <<
	dano_inimigo, // Avisar a determinado cliente que seu player tomou um dano do inimigo <
	atualizar_ondas, // enviar o numero da onda e o alpha da escuridao da noite <<
	novo_chat, // o servidor avisa todos os clientes que há uma nova mensagem no chat <<
	outro_desconectado, // o servidor avisa todos os clientes que tal cliente foi desconectado <<
	atualizar_ping, // servidor devolve a msg ao cliente para ele calcular o ping <
	server_desligado // o servidor avisa todos os clientes que ele foi desligado <<
}
