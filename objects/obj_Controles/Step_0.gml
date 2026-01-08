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
			
			press = mouse_check_button(1);
			dir_tiro = point_direction(x, y+9, mouse_x, mouse_y);
		}
		break;

	case 1: // Game Pad / controle
		if (gamepad_is_connected(gamepad)) {
			mov_up = (gamepad_axis_value(gamepad, gp_axislv) < -.2);
			mov_left = (gamepad_axis_value(gamepad, gp_axislh) < -.2);
			mov_down = (gamepad_axis_value(gamepad, gp_axislv) > .2);
			mov_rigth = (gamepad_axis_value(gamepad, gp_axislh) > .2);
			var _gmovh = (mov_rigth - mov_left);
			var _gmovv = (mov_down - mov_up)
			var _gp_axisrh = gamepad_axis_value(gamepad, gp_axisrh);
			var _gp_axisrv = gamepad_axis_value(gamepad, gp_axisrv);

			with (obj_Player) {
				direction = point_direction(x, y, x + _gmovh, y + _gmovv);
				speed = (_gmovh != 0 or _gmovv != 0);
				
				press = (abs(_gp_axisrh) > 0.2 or abs(_gp_axisrv) > 0.2);
				dir_tiro = point_direction(x, y+9, x + _gp_axisrh, y+9 + _gp_axisrv);
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
					speed = (_mmovh != 0 or _mmovv != 0);
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