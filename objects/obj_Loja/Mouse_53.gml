if (show) {
	// Comprar itens
	for (var i=0; i < array_length(vendas); i++) {
		with (vendas[i]) {
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x1, y1, x2, y2)) {
				fclick = 40; // tempo de click do botão
			
				if (global.Moedas >= custo) { // comprou!
					image = 1;
					global.Moedas -= custo;
				} else { // sem dinheiro
					image = 2;
				}
			}
		}
	}
	
	// Fechar janela com o mouse
	var _x2 = gui_x + sprite_get_width(spr_Loja_fundo)*scale;
	var _y2 = gui_y + sprite_get_height(spr_Loja_fundo)*scale;
	if (! point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), gui_x, gui_y, _x2, _y2)) {
		show = false;
		obj_Player.estado = PL_ESTADOS.PARADO;
	}

} else { 
	var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);
	
	if (_dist_player <= alcance and collision_point(mouse_x, mouse_y, self, false, false)) {
		show = true;
		obj_Player.estado = noone;
	}
}