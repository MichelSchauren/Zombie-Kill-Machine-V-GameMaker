// Mover o tiro na direção do alvo
x += lengthdir_x(variable_struct_get(TIRO, "vel")/fps, direction);
y += lengthdir_y(variable_struct_get(TIRO, "vel")/fps, direction);

// COLISÕES
// colisão com paredes
if (place_meeting(x, y, [obj_Colisores, obj_Estruturas])) {
	instance_destroy();
}

// colisão com inimigos
with (obj_Inimigo) {
	mask_index = sprite_index; // pega a colisão de toda a sprite
	
	if (place_meeting(x, y, other) and estado != noone) {
		// Tira vida do inimigo quando colidir com ele
		vida = max(vida - variable_struct_get(TIRO, "dano"), 0);
		instance_destroy(other);
	}
	
	mask_index = spr_colisao; // volta para colisão padrão
}

if (global.Multiplayer) {
	with (obj_Inimigo_server) {
		mask_index = sprite_index; // pega a colisão de toda a sprite
	
		if (place_meeting(x, y, other)) {
			instance_destroy(other);
		}
	
		mask_index = spr_colisao; // volta para colisão padrão
	}
}

if (pvp) {
	// colisão com o player
	with (obj_Player) {
		mask_index = sprite_index; // pega a colisão de toda a sprite
		
		if (place_meeting(x, y, other) and estado != noone) {
			vida = max(vida - variable_struct_get(TIRO, "dano"), 0);
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