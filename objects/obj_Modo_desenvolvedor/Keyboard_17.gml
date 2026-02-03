if (global.Modo_desenvolvedor) {	
	// ativar/desativar o Spaw dos inimigos
	if (keyboard_check_pressed(ord("E"))) {
		global.Spaw_inimigos = !global.Spaw_inimigos; 
	}

	if (keyboard_check(ord("C"))) {
		// Mostrar caixas de colisão dos inimigos
		if (keyboard_check_pressed(ord("I"))) {
			global.Mostrar_colisoes_inimigos = !global.Mostrar_colisoes_inimigos;
		}

		// Mostrar caixas de colisão do player
		if (keyboard_check_pressed(ord("P"))) {
			global.Mostrar_colisoes_player = !global.Mostrar_colisoes_player;
		}

		// Mostrar caixas de colisão do mapa
		if (keyboard_check_pressed(ord("M"))) {
			obj_Colisores.visible = ! obj_Colisores.visible;
		}
	}
	
	// Trocar modo de controle
	if (keyboard_check_pressed(ord("K"))) {
		if (keyboard_check(vk_shift)) { // Modo de controle secundario
			global.second_control_mode = ! global.second_control_mode;
		} else {
			global.Controller_mode += 1;
			if (global.Controller_mode > 2) global.Controller_mode = 0;
		}
		
		f_Resetar_controles();
	}
	
	// Player imortal
	if (keyboard_check(vk_shift) and keyboard_check_pressed(ord("P"))) {
		global.Player_imortal = ! global.Player_imortal;
	}
	
	// Pausar/despausar ondas
	if (keyboard_check_pressed(ord("T"))) {
		obj_Ondas.pausar(!global.Tempo_pausado);
	}
	
	// pular onda
	if (keyboard_check_pressed(ord("O"))) {
		obj_Ondas.pular_onda();	
	}
}