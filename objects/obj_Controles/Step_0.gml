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
		switch (global.second_control_mode) {
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
				}
			
				break;
				
			case 1: // touchpad
				if (instance_exists(obj_Joystick_mover)) {
					with (obj_Player) {
						direction = obj_Joystick_mover.input_dir;
						speed = obj_Joystick_mover.active;
					}
				}
				
				break;
		}
		
		if (instance_exists(obj_Joystick_atirar)) {
			with (obj_Player) {
				press = obj_Joystick_atirar.active;
				dir_tiro = obj_Joystick_atirar.input_dir;
			}
		}
		
		break;
}