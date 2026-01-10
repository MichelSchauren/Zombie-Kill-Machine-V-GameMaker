/*if (estado != INIMIGOS_ESTADOS.MORRENDO and estado != noone) {
	// Atirar maxado no player
	estado = INIMIGOS_ESTADOS.ATIRANDO;
	sprite_index = spr_MiniBoss_atirando;
	image_index = 0;
	pode_atirar = false;
}*/

if (estado != INIMIGOS_ESTADOS.MORRENDO and estado != noone) {
	mask_index = sprite_index;
	if (!place_meeting(x, y, obj_Colisores)) {
		// Atirar maxado no player
		estado = INIMIGOS_ESTADOS.ATIRANDO;
		sprite_index = spr_MiniBoss_atirando;
		image_index = 0;
		pode_atirar = false;
	} else {
		alarm[1] = 100;
	}
	mask_index = spr_colisao;
}