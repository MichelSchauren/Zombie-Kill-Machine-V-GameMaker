if (global.Modo_desenvolvedor) {
	// Mostrar fps
	draw_set_colour(c_white);
	draw_set_font(font_Consolas_12);
	draw_set_halign(fa_right);

	draw_text(840, 20, $"fps: {game_get_speed(gamespeed_fps)}");
}