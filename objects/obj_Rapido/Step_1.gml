if (estado == INIMIGOS_ESTADOS.DASHANDO) {
	var _movx = lengthdir_x(dash_vel, dash_direction);
	var _movy = lengthdir_y(dash_vel, dash_direction);
	var _colididos = move_and_collide(_movx, _movy, [obj_Player, obj_Colisores]);
	
	if (array_length(_colididos) > 0) {
		if (_colididos[0] == instance_find(obj_Player, 0)) {
			obj_Player.vida = max(obj_Player.vida - dano, 0);	
		}
		
		estado = INIMIGOS_ESTADOS.PERSEGUINDO;
		sprite_index = spr_andando;
		image_index = 0;
		image_speed = 1;
	}
}