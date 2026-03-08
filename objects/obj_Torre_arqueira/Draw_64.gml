if (show) {	
	// Fundo
	draw_sprite_ext(spr_Janela_torre_arqueira, 0, gui_x, gui_y, scale, scale, 0, -1, 1);
		
	// janela
	for (var i=0; i < array_length(janela); i++) {
		with (janela[i]) {
			draw_sprite_ext(sprite, image, x1, y1, other.scale, other.scale, 0, -1, 1);
		}
	}
	
	// Torre
	draw_sprite_ext(spr_Torre_arqueira_folder, level, gui_x +144*scale, gui_y +172*scale, scale, scale, 0, -1, 1);
	
	// Arqueiro
	if (instance_exists(arqueiro)) draw_sprite_ext(spr_Arqueiro_folder, arqueiro.level, gui_x +391*scale, gui_y +172*scale, scale, scale, 0, -1, 1);
	
	// textos
	draw_set_font(font_Consolas_20);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(gui_x + 267 * scale, gui_y + 23 * scale, "TORRE ARQUEIRA"); // titulo
	
	draw_set_font(font_Consolas_12);
	draw_set_colour(c_green);
	if (level < 4) draw_text(gui_x + 144 * scale, gui_y + 290 * scale, vars.preco); // preço torre
	else draw_text(gui_x + 144 * scale, gui_y + 290 * scale, "MÁX");
	if (arqueiro.level < 4) draw_text(gui_x + 392 * scale, gui_y + 290 * scale, arqueiro.vars.preco); // preço arqueiro
	else draw_text(gui_x + 392 * scale, gui_y + 290 * scale, "MÁX");
}
