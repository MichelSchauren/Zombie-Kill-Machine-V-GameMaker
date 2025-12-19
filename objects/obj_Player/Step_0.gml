if (morto) {
	if (image_index >= image_number -1) {
		image_speed = 0
	}
}
else {
	var _up, _left, _down, _right;

	// Inputs
	_up = keyboard_check(inputs.up);
	_left = keyboard_check(inputs.left);
	_down = keyboard_check(inputs.down);
	_right = keyboard_check(inputs.right);
	mouse_press = mouse_check_button(1);

	// Mover o Player
	movx = (_right - _left) * vel;
	movy = (_down - _up) * vel;
	// Velocidade correta na diagonal
	if (movx != 0 and movy != 0) movx *= .7; movy *= .7;

	// Definir sprite
	// Se movendo
	if (movx != 0 or movy != 0) {
		if (mouse_press) {// atirando enquanto se move
			sprite_index = spr_Player_atirandomov;
			image_xscale = sign(mouse_x - x);
			vel = global.Player_VEL_ATIRANDO;
		} else { // correndo
			sprite_index = spr_Player_correndo;
			if (movx != 0) image_xscale = sign(movx);
			vel = global.Player_VEL_CORRENDO;
		}
	// Parado
	} else {
		if (mouse_press) {// atirando parado
			sprite_index = spr_Player_atirando;
			image_xscale = sign(mouse_x - x);
		} else {// parado
			sprite_index = spr_Player_parado;
		}
	}

	// Morrer
	if (vida == 0) {
		morto = true;
		sprite_index = spr_Player_morrendo;
		vel = 0
		alarm[1] = 150; // // Ir para a tela de gameover depois de 150 frames
	}

	// Atirar
	if (mouse_press and pode_atirar) {
		var _tiro = noone;
		if image_xscale < 0 {
			_tiro = instance_create_layer(x-28, y+9, "Tiros", obj_Tiro);
			_tiro.direction = point_direction(x-28, y+9, mouse_x, mouse_y);
		} else {
			_tiro = instance_create_layer(x+28, y+9, "Tiros", obj_Tiro);
			_tiro.direction = point_direction(x+28, y+9, mouse_x, mouse_y);
		}
		alarm[0] = tpf;
		pode_atirar = false;
	}
}