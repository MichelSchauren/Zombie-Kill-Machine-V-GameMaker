if ((window_get_width() != last_width or window_get_height() != last_height) and window_get_width() != 0 and window_get_height() != 0) {
	redimencionar_tela();	
}

with (b_menu) {
	var x2 = x + sprite_get_width(sprite)*escalaX;
	var y2 = y + sprite_get_height(sprite)*escalaY;
	if (point_in_rectangle(mouse_x, mouse_y, x, y, x2, y2)) {
		image = 1;
	} else image = 0;
}