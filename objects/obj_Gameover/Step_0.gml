if (window_get_width() != last_width or window_get_height() != last_height) {
	redimencionar_tela();	
}

with (b_menu) {
	var x2 = gui_left + sprite_get_width(sprite)*scale;
	var y2 = gui_top + sprite_get_height(sprite)*scale;
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), gui_left, gui_top, x2, y2)) {
		image_scale = lerp(image_scale, scale*1.2, 0.2);
	} else {
		image_scale = lerp(image_scale, scale, 0.3);
	}
}