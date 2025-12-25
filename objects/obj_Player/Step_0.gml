if (morto) {
	if (image_index >= image_number -1) {
		image_speed = 0;
		image_index = image_number-1;
	}
}
else {
	var _up, _left, _down, _right, _buffer;

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

	// Atirar
	if (mouse_press and pode_atirar) {
		alarm[0] = tpf;
		pode_atirar = false;
		
		var _x;
		if (image_xscale < 0) _x = x-28;
		else _x = x+28;
		
		// Criar tiro
		if (room == Multiplayer) {
			// Avisar server de que um novo tiro foi criado
			_buffer = obj_Client_tcp.client_buffer;
			buffer_seek(_buffer, buffer_seek_start, 0);
			buffer_write(_buffer, buffer_u8, Events_client_server.tiro_player);
			buffer_write(_buffer, buffer_u16, _x);
			buffer_write(_buffer, buffer_u16, y+9);
			buffer_write(_buffer, buffer_u16, point_direction(_x, y+9, mouse_x, mouse_y));
			network_send_packet(obj_Client_tcp.socket_tcp, _buffer, buffer_tell(_buffer));
			
		} else {
			var _tiro = noone;
			_tiro = instance_create_layer(_x, y+9, "Tiros", obj_Tiro);
			_tiro.direction = point_direction(_x, y+9, mouse_x, mouse_y);
		}
	}
	
	// Morrer
	if (vida == 0) {
		morto = true;
		sprite_index = spr_Player_morrendo;
		alarm[1] = 150; // // Ir para a tela de gameover depois de 150 frames
	}
	
	// Mover caso não colida com o objeto colisor
	var _mask_original = mask_index;
	mask_index = spr_Player_mask_pes;
	move_and_collide(movx*vel, movy*vel, obj_Colisores);
	mask_index = _mask_original;
}