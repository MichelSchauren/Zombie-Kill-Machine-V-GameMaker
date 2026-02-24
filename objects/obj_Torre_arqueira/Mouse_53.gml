if (show) {
	// Clicar em botões
	for (var i=0; i < array_length(janela); i++) {
		with (janela[i]) {
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x1, y1, x2, y2) and funcao and fclick < 0) {
				fclick = 10; // tempo de click do botão
				image = 1;
			}
		}
	}
} else { 
	var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);
	
	if (_dist_player <= dist_interface and collision_point(mouse_x, mouse_y, self, false, false)) {
		show = true;
		obj_Player.estado = noone;
	}
}