if (global.Modo_desenvolvedor) {	
	// Spaw dos inimigos
	if (keyboard_check_pressed(ord("E"))) {
		global.Spaw_inimigos = !global.Spaw_inimigos; 
	}

	// Mostrar caixas de colisão dos inimigos
	if (keyboard_check(ord("C")) and keyboard_check_pressed(ord("I"))) {
		global.Mostrar_colisoes_inimigos = !global.Mostrar_colisoes_inimigos;
	}

	// Mostrar caixas de colisão do player
	if (keyboard_check(ord("C")) and keyboard_check_pressed(ord("P"))) {
		global.Mostrar_colisoes_player = !global.Mostrar_colisoes_player;
	}

	// Mostrar caixas de colisão do mapa
	if (keyboard_check(ord("C")) and keyboard_check_pressed(ord("M"))) {
		obj_Colisores.visible = ! obj_Colisores.visible;
	}

	// Controle do fps
	if (keyboard_check(ord("F"))) {
		if (keyboard_check(vk_alt)) {
			game_set_speed(game_get_speed(gamespeed_fps) -1, gamespeed_fps);
		} else {
			game_set_speed(game_get_speed(gamespeed_fps) +1, gamespeed_fps);
		}
	}
}