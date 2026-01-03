switch (global.Controller_mode) {
	case 0: // PC / Teclado
		mov_up = keyboard_check(vk_up);
		mov_left = keyboard_check(vk_left);
		mov_down = keyboard_check(vk_down);
		mov_rigth = keyboard_check(vk_right);
		var _movh = (mov_rigth - mov_left);
		var _movv = (mov_down - mov_up)
		
		with (obj_Player) {
			direction = point_direction(x, y, x + _movh, y + _movv);
			if (_movh != 0 or _movv != 0) {
				speed = 1;
			} else {
				speed = 0;
			}
			
			// Definir a posição x do tiro de acordo com a direção do player
			var _x_tiro;
			if (image_xscale < 0) _x_tiro = x-28;
			else _x_tiro = x+28;
			
			press = mouse_check_button(1);
			dir_tiro = point_direction(x, y+9, mouse_x, mouse_y);
		}
		break;

	case 1: // Game Pad / controle
		var _gamepad = 0;
		if (gamepad_is_connected(_gamepad)) {
			gamepad_set_axis_deadzone(_gamepad, .2);
			
			mov_up = keyboard_check(vk_up);
			mov_left = keyboard_check(vk_left);
			mov_down = keyboard_check(vk_down);
			mov_rigth = keyboard_check(vk_right);
			var _gmovh = (mov_rigth - mov_left);
			var _gmovv = (mov_down - mov_up)
			// isso pode ser alterado no futuro
			with (obj_Player) {
				direction = point_direction(x, y, x + _gmovh, y + _gmovv);
				if (_gmovh != 0 or _gmovv != 0) {
					speed = 1;
				} else {
					speed = 0;
				}
				
				// atirar?
			}
		}
		break;

	case 2: // Mobile / touch screen
		var _mira_press, _mira_dir;
		if (mouse_check_button(1) and collision_point(mouse_x, mouse_y, touchpad_mira_fundo, false, false)) {
			_mira_press = true;
			_mira_dir = point_direction(touchpad_mira_fundo.x, touchpad_mira_fundo.y, mouse_x, mouse_y);
		} else {
			_mira_press = false;
			_mira_dir = 0;
		}
		touchpad_mira.movendo = _mira_press;
		touchpad_mira.direction = _mira_dir;
	
		switch (mobile_direction_mode) {
			case 0: // setinhas
				mov_up = keyboard_check(vk_up);
				mov_left = keyboard_check(vk_left);
				mov_down = keyboard_check(vk_down);
				mov_rigth = keyboard_check(vk_right);
				var _mmovh = (mov_rigth - mov_left);
				var _mmovv = (mov_down - mov_up)
				
				with (obj_Player) {
					direction = point_direction(x, y, x + _mmovh, y + _mmovv);
					if (_mmovh != 0 or _mmovv != 0) {
						speed = 1;
					} else {
						speed = 0;
					}
					
					press = _mira_press;
					if (_mira_press) dir_tiro = _mira_dir;
					else dir_tiro = 0;		
				}
			
				break;
				
			case 1: // touchpad
				var _p_mov = false;
				if (mouse_check_button(1) and collision_point(mouse_x, mouse_y, touchpad_direction_fundo, false, false)) {
					direction = point_direction(touchpad_direction_fundo.x, touchpad_direction_fundo.y, mouse_x, mouse_y);
					touchpad_direction.direction = direction;
					touchpad_direction.movendo = true;
					_p_mov = true;
				} else {
					touchpad_direction.movendo = false;
				}
				
				with (obj_Player) {
					direction = other.direction;
					speed = _p_mov;
					
					press = _mira_press;
					if (_mira_press) dir_tiro = _mira_dir;
					else dir_tiro = 0;	
				}
				
				break;
		}
		
		break;
}