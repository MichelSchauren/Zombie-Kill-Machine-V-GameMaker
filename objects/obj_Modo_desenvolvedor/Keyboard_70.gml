if (global.Modo_desenvolvedor) {
	// Controle de FPS
	if (keyboard_check_pressed(vk_add)) {
		game_set_speed(game_get_speed(gamespeed_fps) +1, gamespeed_fps);
	}

	if (keyboard_check_pressed(vk_subtract)) {
		game_set_speed(game_get_speed(gamespeed_fps) -1, gamespeed_fps);
	}
}