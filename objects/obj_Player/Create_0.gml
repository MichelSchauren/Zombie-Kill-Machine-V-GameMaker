vida = global.Player_VIDA_TOTAL;
vel = global.Player_VEL_CORRENDO;
spr_colisao = spr_Player_mask_pes;
mask_index = spr_colisao;

pode_atirar = true;
tpf = game_get_speed(gamespeed_fps) / global.Tiro_TPS;
dir_tiro = 0;

// ESTADOS
enum PL_ESTADOS {
	PARADO,
	CORRENDO,
	ATIRANDO,
	ATIRANDO_ANDANDO,
	MORRENDO
}
estado = PL_ESTADOS.PARADO;


// MULTIPLAYER
// cliente envia infos sobre seu player para o servidor (nome, x, y)
if (room == Multiplayer) {
	// Posição aleatória no multiplayer
	x = int64(random_range(1250, 1800));
	y = int64(random_range(1450, 1540));
	
	// Enviar dados
	var _buffer = obj_Client_tcp.client_buffer;
	buffer_seek(_buffer, buffer_seek_start, 0); // Ir para início do buffer
	buffer_write(_buffer, buffer_u8, Events_client_server.dados_player);
	buffer_write(_buffer, buffer_string, global.Player_name); // Meu Nome
	buffer_write(_buffer, buffer_u16, x); // Cordenada X do player
	buffer_write(_buffer, buffer_u16, y); // Cordenada Y do player
	network_send_packet(obj_Client_tcp.socket_tcp, _buffer, buffer_tell(_buffer));
}


// CONTROLAR PLAYER
mov_up = false;
mov_left = false;
mov_down = false;
mov_rigth = false;
press = false;