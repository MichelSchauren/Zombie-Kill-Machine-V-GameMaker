if ((window_get_width() != last_width or window_get_height() != last_height) and window_get_width() != 0 and window_get_height() != 0) {
	redimencionar_tela();	
}

// Botões aumentam de tamanho quando passa o mouse em cima
for (var i=0; i < 3; i++) {
	with (elementos[i]) {
		var x2 = x + sprite_get_width(sprite)*escalaX;
		var y2 = y + sprite_get_height(sprite)*escalaY;
		if (point_in_rectangle(mouse_x, mouse_y, x, y, x2, y2)) {
			image = 1;
		} else image = 0;
	}
}

// INPUT NOME
with (input_nome) {
	// mobile
	if (global.Controller_mode == 2 and device_mouse_check_button_pressed(0, mb_left)) {
		if (keyboard_check_pressed(ord("I"))) {
			keyboard_virtual_show(kbv_type_default, kbv_autocapitalize_words, kbv_returnkey_done, false);
			selecionado = true;
			keyboard_string = global.Player_name; // atualiza o keyboard para ter o nome salvo
		} else {
			keyboard_virtual_hide();
			selecionado = false;
			keyboard_string = ""; // limpa o keyboard
		}
	// pc	
	} else if (mouse_check_button_pressed(mb_left)) {
		if (keyboard_check_pressed(ord("I"))) {
			selecionado = true;
			keyboard_string = global.Player_name; // atualiza o keyboard para ter o nome salvo
		} else {
			selecionado = false;
			keyboard_string = ""; // limpa o keyboard
		}
	}

	if (selecionado) {
	    // Adiciona o que foi digitado na string
	    if (string_length(keyboard_string) < max_caracteres) {
			global.Player_name = keyboard_string;
		}
	
	    // Enter - Sair
	    if (keyboard_check_pressed(vk_enter) or keyboard_check(vk_return)) {
	        selecionado = false;
			keyboard_string = ""; // limpa o keyboard
		
			if (global.Controller_mode == 2) { // Digitar no celular (MOBILE)
				// fechar teclado
				keyboard_virtual_hide();
			}
	    }
	
	    // Backspace - Apagar
	    if (keyboard_check_pressed(vk_backspace)) {
	        if (string_length(keyboard_string) > 0) {
				if (string_length(keyboard_string) > max_caracteres) keyboard_string = global.Player_name;
	            keyboard_string = string_delete(keyboard_string, -1, 0);
	            global.Player_name = keyboard_string;
	        }
	    }
	}

}