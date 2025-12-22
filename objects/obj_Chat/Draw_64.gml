draw_set_colour(c_gray);
draw_rectangle(10, 10, 200, 300, false);

for (var i = 0; i >= array_length(mensagens); i++) {
	var _msg = mensagens[i];
	draw_set_font(font_Consolas_12);
	
	draw_set_colour(c_aqua);
	draw_text(20, 20 + i*20, _msg[0] + ": ");
	
	draw_set_colour(c_white);
	draw_text(20 + string_width($"{_msg[0]}: "), 20 + i*20, _msg[0]);
}