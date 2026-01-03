// valores dos controles
mobile_direction_mode = 1; // Modo do controle de direção no mobile (0:setas, 1:touchpad)
touchpad_direction = noone;
touchpad_direction_fundo = noone;
touchpad_mira = noone;
touchpad_mira_fundo = noone;
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
if (MOBILE and global.Controller_mode == 2) {
	var _vpx = camera_get_view_x(viewport);
	var _vpy = camera_get_view_y(viewport);
			
	// Criar direção
	switch (mobile_direction_mode) {
		case 0:
			virtual_key_add(120, 440, 80, 80, vk_up);
			virtual_key_add(20, 540, 80, 80, vk_left);
			virtual_key_add(120, 540, 80, 80, vk_down);
			virtual_key_add(220, 540, 80, 80, vk_right);
			break;
		case 1:
			touchpad_direction = instance_create_layer(_vpx +200, _vpy +490, "Abstratos", obj_Touchpad_direction);
			touchpad_direction_fundo = instance_create_layer(_vpx +200, _vpy +490, "Abstratos", obj_Touchpad_direction_fundo);
	}
	
	// Criar mira para atirar
	touchpad_mira = instance_create_layer(_vpx + 760, _vpy +490, "Abstratos", obj_Touchpad_mira);
	touchpad_mira_fundo = instance_create_layer(_vpx + 760, _vpy +490, "Abstratos", obj_Touchpad_mira_fundo);
}
