// Mover o tiro na direção do alvo
if (! parado) {
	x += lengthdir_x(global.Maxado_VEL, direction);
	y += lengthdir_y(global.Maxado_VEL, direction);

	// colisão com o player
	with (obj_Player) {
		mask_index = sprite_index; // pega a colisão de toda a sprite
		
		if (place_meeting(x, y, other) and estado != noone) {
			vida = max(vida - global.Maxado_DANO, 0);
			instance_destroy(other);
		}
		
		mask_index = spr_colisao; // volta para colisão padrão
	}
	// colisão com outros
	with (obj_Outro) {
		if (place_meeting(x, y, other)) {
			instance_destroy(other);
		}
	}
}

// COLISÕES
// colisão com paredes
if (place_meeting(x, y, [obj_Colisores, obj_Estruturas])) {
	parado = true;
	image_speed = 0;
}