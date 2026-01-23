vida = PLAYER_VIDA_TOTAL;
vel = PLAYER_VEL_CORRENDO;
spr_colisao = spr_Player_mask_pes;
mask_index = spr_colisao;

pode_atirar = true;
tpf = game_get_speed(gamespeed_fps) / TIRO_TPS;
press = false;
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