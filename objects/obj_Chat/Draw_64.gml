draw_set_colour(c_dkgray);
draw_rectangle(20, 88, 280, 380, false);

for (var i = 0; i < ds_list_size(mensagens); i++) {
	var _msg = mensagens[| i];
	draw_set_font(font_Consolas_8);
	draw_set_halign(fa_left);
	
	draw_set_colour(c_aqua);
	draw_text(40, 108 + i*40, _msg[0] + ": ");
	
	draw_set_colour(c_white);
	draw_text(40 + string_width($"{_msg[0]}: "), 108 + i*40, _msg[1]);
}