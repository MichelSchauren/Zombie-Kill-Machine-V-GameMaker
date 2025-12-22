// VARIAVEIS GLOBAIS
global.Player_name = "";
global.Player_vida = 100;


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

// multiplayer
global.porta_tcp = 64193;
global.porta_udp = 64194;
global.conect_server_ip = noone;



// Isso faz o código interpretar as 2 teclas da mesma forma 
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);