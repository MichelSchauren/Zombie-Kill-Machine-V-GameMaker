// Desenhar fundo
var _spr_fundo = spr_Fundo_geral;
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _scale_x = _gui_w / sprite_get_width(_spr_fundo);
var _scale_y = _gui_h / sprite_get_height(_spr_fundo);
var _scale = max(_scale_x, _scale_y);

draw_sprite_ext(_spr_fundo, 0, _gui_w / 2, _gui_h / 2, _scale, _scale, 0, c_white, 1);


// Desenhar items
for (var i=0; i < array_length(elementos); i++) {
	with (elementos[i]) {
		if (sprite != noone) draw_sprite_ext(sprite, image, gui_x, gui_y, image_scale, image_scale, 0, -1, 1);
	}	
}

// Desenhar versão
draw_set_colour(c_white);
draw_set_font(font_Consolas_40);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

var _tversion = elementos[4];
draw_text_transformed(_tversion.gui_x, _tversion.gui_y, $"v{GM_version}", _tversion.scale, _tversion.scale, 0);

// Input nome
with (input_nome) {
	var _texto;
	if (global.Player_name == "" and !selecionado) _texto = folder;
	else _texto = global.Player_name;

	// Texto
	draw_set_color(c_black);
	draw_set_font(font_Consolas_40);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text_transformed(gui_left + 20, gui_y, _texto, scale, scale, 0);

	// Cursor piscando se ativo
	if (selecionado and (current_time mod 1000) < 500) {
	    draw_text_transformed(gui_left + 20 + string_width(_texto)*scale, gui_y, "|", scale, scale, 0);
}
}