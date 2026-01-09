if (estado != INIMIGOS_ESTADOS.MORRENDO and estado != noone) {
	// Atirar maxado no player
	estado = INIMIGOS_ESTADOS.ATIRANDO;
	sprite_index = spr_MiniBoss_atirando;
	image_index = 0;
	pode_atirar = false;
}
