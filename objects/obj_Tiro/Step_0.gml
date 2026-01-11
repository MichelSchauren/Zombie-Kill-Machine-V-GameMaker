// Mover o tiro na direção do alvo
x += lengthdir_x(global.Tiro_VEL, direction);
y += lengthdir_y(global.Tiro_VEL, direction);

// COLISÕES
// colisão com paredes
if (place_meeting(x, y, [obj_Colisores, obj_Estruturas])) {
	instance_destroy();
}

// colisão com inimigos
with (obj_Inimigos) {
	mask_index = sprite_index; // pega a colisão de toda a sprite
	
	if (place_meeting(x, y, other) and estado != noone) {
		// Tira vida do inimigo quando colidir com ele
		vida = max(vida - global.Tiro_DANO, 0);
		instance_destroy(other);
	}
	
	mask_index = spr_colisao; // volta para colisão padrão
}

if (pvp) {
	// colisão com o player
	with (obj_Player) {
		mask_index = sprite_index; // pega a colisão de toda a sprite
		
		if (place_meeting(x, y, other) and estado != noone) {
			vida = max(vida - global.Tiro_DANO, 0);
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