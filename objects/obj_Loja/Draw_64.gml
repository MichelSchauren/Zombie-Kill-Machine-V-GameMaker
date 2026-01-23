if (show) {	
	// Fundo
	draw_sprite_ext(spr_Loja_fundo, 0, gui_x, gui_y, scale, scale, 0, -1, 1);
		
	// vendas
	for (var i=0; i < array_length(vendas); i++) {
		with (vendas[i]) {
			draw_sprite_ext(sprite, image, x1, y1, other.scale, other.scale, 0, -1, 1);
		}
	}
}