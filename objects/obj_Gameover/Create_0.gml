b_menu = {"sprite": spr_Botao_menu, "key": vk_escape, "x": 810, "y": 800};

with (b_menu) {
	offsetX = x / room_width;
	offsetY = y / room_height;
	scale = 1;
	image_scale = scale;
	gui_x = display_get_gui_width() * offsetX;
	gui_y = display_get_gui_height() * offsetY;
		
	if (sprite != noone) {
		gui_left = gui_x - sprite_get_xoffset(sprite)*scale;
		gui_top = gui_y - sprite_get_yoffset(sprite)*scale;
		image = 0;
		if (key != noone) vk_id = virtual_key_add(gui_left, gui_top, sprite_get_width(sprite)*scale, sprite_get_height(sprite)*scale, key);
	}
}

reposicionar_itens = function () {
	with (b_menu) {
		scale = min (display_get_gui_width() / room_width, display_get_gui_height() / room_height);
		image_scale = scale;
		gui_x = display_get_gui_width() * offsetX;
		gui_y = display_get_gui_height() * offsetY;
		x = camera_get_view_x(view_camera[0]) + gui_x;
		y = camera_get_view_y(view_camera[0]) + gui_y;
			
		if (sprite != noone) {
			gui_left = gui_x - sprite_get_xoffset(sprite)*scale;
			gui_top = gui_y - sprite_get_yoffset(sprite)*scale;
			image = 0;
			if (key != noone) {
				virtual_key_delete(vk_id);
				vk_id = virtual_key_add(gui_left, gui_top, sprite_get_width(sprite)*scale, sprite_get_height(sprite)*scale, key);
			}
		}
	}
}


// CAMERA
last_width = window_get_width();
last_height = window_get_height();

redimencionar_tela = function () {
	display_set_gui_size(window_get_width(), window_get_height()); // n me pergunte o pq disso
	
	last_width = window_get_width();
	last_height = window_get_height();
	
	// Obter as dimensões atuais da janela
	var _w = min (window_get_width(), 1620);
	var _h = min (window_get_height(), 1080);
		
	var _x1 = max((room_width-_w)/2, 0);
	var _y1 = max((room_height-_h)/2, 0);
	
	if (window_get_width() != 0 and window_get_height() != 0) {
		camera_set_view_size(view_camera[0], _w, _h);
		surface_resize(application_surface, _w, _h);
		camera_set_view_pos(view_camera[0], _x1, _y1);
	}
	
	reposicionar_itens();
}

redimencionar_tela();
