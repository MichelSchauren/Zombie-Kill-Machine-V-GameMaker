// valores dos controles
mov_up = false;
mov_left = false;
mov_down = false;
mov_rigth = false;
press = false;
xpress = 0;
ypress = 0;
viewport = view_camera[0];

// PC / TECLADO
// Isso faz o código interpretar as 2 teclas da mesma forma 
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);

// MOBILE
if (global.Controller_mode == 2) {
	// Criar direção
	switch (global.second_control_mode) {// Controle de direção no mobile (0:setas, 1:touchpad)
		case 0:
			virtual_key_add(120, 440, 80, 80, vk_up);
			virtual_key_add(20, 540, 80, 80, vk_left);
			virtual_key_add(120, 540, 80, 80, vk_down);
			virtual_key_add(220, 540, 80, 80, vk_right);
			break;
		case 1:
			// Criar Joystich para se mover
			instance_create_layer(0, 0, "Abstratos", obj_Joystick_mover);
	}
	
	// Criar Joystich para atirar
	instance_create_layer(0, 0, "Abstratos", obj_Joystick_atirar);
	
}

reposicionar_joystick = function (joystick, gui_x, gui_y) {
	with (joystick) {
		anchor_x = gui_x;
		anchor_y = gui_y;
		stick_x = anchor_x;
		stick_y = anchor_y;
	}
}