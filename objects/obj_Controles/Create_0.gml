// valores dos controles
mov_up = false;
mov_left = false;
mov_down = false;
mov_rigth = false;
press = false;
xpress = 0;
ypress = 0;

gamepad = 0;

x_mobile_mover = min(window_get_width(), 1580) * 0.2;
y_mobile_mover = min(window_get_height(), 720) * 0.8;
x_mobile_atirar = min(window_get_width(), 1580) * 0.8;
y_mobile_atirar = min(window_get_height(), 720) * 0.8;

switch (global.Controller_mode) {
	case 0: // PC / TECLADO
		// Isso faz o código interpretar as 2 teclas da mesma forma 
		keyboard_set_map(ord("W"), vk_up);
		keyboard_set_map(ord("A"), vk_left);
		keyboard_set_map(ord("S"), vk_down);
		keyboard_set_map(ord("D"), vk_right);
		
		break;
		
	case 1: // GAMEPAD
		for (var i=0; i <= gamepad_get_device_count(); i++) {
			if (gamepad_is_connected(i)) gamepad = i;
		}
		
		gamepad_set_axis_deadzone(gamepad, .2);
		
		break;
	
	case 2: // MOBILE
		// Criar direção
		switch (global.second_control_mode) {// Controle de direção no mobile (0:setas, 1:touchpad)
			case 0:
				virtual_key_add(x_mobile_mover -40, y_mobile_mover -90, 80, 80, vk_up);
				virtual_key_add(x_mobile_mover -140, y_mobile_mover +10, 80, 80, vk_left);
				virtual_key_add(x_mobile_mover -40, y_mobile_mover +10, 80, 80, vk_down);
				virtual_key_add(x_mobile_mover +60, y_mobile_mover +10, 80, 80, vk_right);
				break;
			case 1:
				// Criar Joystich para se mover
				instance_create_layer(0, 0, "Abstratos", obj_Joystick_mover);
		}
	
		// Criar Joystich para atirar
		instance_create_layer(0, 0, "Abstratos", obj_Joystick_atirar);
		
		break;	
}
