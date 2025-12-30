// Mover o tiro na direção do alvo
x += lengthdir_x(global.Tiro_VEL, direction);
y += lengthdir_y(global.Tiro_VEL, direction);

// COLISÕES
with (obj_Inimigos) {
	mask_index = sprite_index; // pega a colisão de toda a sprite
	
	if (place_meeting(x, y, other)) {
		// Tira vida do inimigo quando colidir com ele
		vida = max(vida - global.Tiro_DANO, 0);
		instance_destroy(other);
	}
	
	mask_index = spr_colisao; // volta para colisão padrão
}
