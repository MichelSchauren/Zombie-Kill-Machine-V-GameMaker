var _mostrar = "";
if (texto == "" and !selecionado) {
	_mostrar = folder;
	draw_set_color(c_gray);
} else {
	_mostrar = texto;
	draw_set_color(c_aqua);
}

// Texto
draw_set_font(font_Consolas_12);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(x, y, _mostrar);

// Cursor piscando se ativo
if (selecionado and (current_time mod 1000) < 500) {
    draw_text(x + string_width(_mostrar), y, "|");
}