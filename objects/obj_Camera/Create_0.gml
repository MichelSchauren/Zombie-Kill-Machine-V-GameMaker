last_width = window_get_width();
last_height = window_get_height();

redimencionar_tela = function () {
	display_set_gui_size(window_get_width(), window_get_height()); // n me pergunte o pq disso
	
	last_width = window_get_width();
	last_height = window_get_height();
	
	// Obter as dimensões atuais da janela
	var _w = display_get_gui_width();
	var _h = display_get_gui_height();
	
	if (window_get_width() != 0 and window_get_height() != 0) {
		camera_set_view_size(view_camera[0], _w, _h);
		surface_resize(application_surface, _w, _h);
		camera_set_view_border(view_camera[0], _w/2, _h/2);
	}
}

redimencionar_tela();
