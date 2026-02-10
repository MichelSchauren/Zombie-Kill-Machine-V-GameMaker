if (! parado) {
	// Mover a flexa na direção do alvo
	x +=  lengthdir_x(variable_struct_get(FLEXA, "vel")/fps, direction);
	y_real += lengthdir_y(variable_struct_get(FLEXA, "vel")/fps, direction);
	z = min(z + vel_z, 0);
	y = y_real + z;
	
	vel_z += gravidade;
	image_angle = point_direction(xprevious, yprevious, x, y); // ângulo natural
	depth = obj_DepthSorting.entidades_depth - y_real + z; // deep sorting
	
	// flexa teleguiada
	if (instance_exists(target)) {
		direction = point_direction(x, y_real, target.x, target.y);
		if (point_distance(x, y_real, target.x, target.y) < 10) target = noone;
	}

	// colisão com inimigos
	with (obj_Inimigo) {
		mask_index = sprite_index; // pega a colisão de toda a sprite
	
		if (place_meeting(x, y, other) and -other.z <= sprite_height) {
			// Tira vida do inimigo quando colidir com ele
			vida = max(vida - variable_struct_get(FLEXA, "dano"), 0);
			instance_destroy(other);
		}

		mask_index = spr_colisao; // volta para colisão padrão
	}
	
	// colisão com paredes/chão
	if (z == 0 or place_meeting(x, y, obj_Colisores)) {
		parado = true;
		image_speed = 0;
	}
	// colisão com estruturas
	var _colid_estr = instance_place(x, y_real, obj_Estruturas);
	if (_colid_estr) with (_colid_estr) {
		if (-other.z <= min(sprite_height, 80)) {
			other.parado = true;
			other.image_speed = 0;
		}
	}
}