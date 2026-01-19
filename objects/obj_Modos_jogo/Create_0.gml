// ELEMENTOS
elementos = [ // {sprite, key, x, y, offsetX, offsetY, gui_x, gui_y}
	{"sprite": spr_Botao_solo, "key": ord("S"), "x": 32, "y": 96}, // Solo
	{"sprite": spr_Botao_multiplayer, "key": ord("M"), "x": 800, "y": 96} // Multiplayer

];

for (var i=0; i < array_length(elementos); i++) {
	var _item = elementos[i];
	with (_item) {
		offsetX = x / room_width;
		offsetY = y / room_height;
		escalaX = 1;
		escalaY = 1;
		gui_x = window_get_width() * offsetX;
		gui_y = window_get_height() * offsetY;
		image = 0;
		
		if (sprite != noone and key != noone) {
			vk_id = virtual_key_add(gui_x, gui_y, sprite_get_width(sprite)*escalaX, sprite_get_height(sprite)*escalaY, key);
		}
	}
}

reposicionar_itens = function () {
	for (var i=0; i < array_length(elementos); i++) {
		with (elementos[i]) {
			escalaX = window_get_width() / room_width;
			escalaY = window_get_height() / room_height;
			gui_x = window_get_width() * offsetX;
			gui_y = window_get_height() * offsetY;
			x = camera_get_view_x(view_camera[0]) + gui_x;
			y = camera_get_view_y(view_camera[0]) + gui_y;
			
			if (sprite != noone and key != noone) {
				virtual_key_delete(vk_id);
				vk_id = virtual_key_add(gui_x, gui_y, sprite_get_width(sprite)*escalaX, sprite_get_height(sprite)*escalaY, key);
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
	var _w = display_get_gui_width();
	var _h = display_get_gui_height();
		
	var _x1 = max((room_width-_w)/2, 0);
	var _y1 = max((room_height-_h)/2, 0);
	
	camera_set_view_size(view_camera[0], _w, _h);
	surface_resize(application_surface, _w, _h);
	camera_set_view_pos(view_camera[0], _x1, _y1);
	
	reposicionar_itens();
}

redimencionar_tela();
