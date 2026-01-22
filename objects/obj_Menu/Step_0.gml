if (window_get_width() != last_width or window_get_height() != last_height) {
	redimencionar_tela();	
}

// Botões aumentam de tamanho quando passa o mouse em cima
for (var i=0; i < 3; i++) {
	with (elementos[i]) {
		var x2 = gui_left + sprite_get_width(sprite)*scale;
		var y2 = gui_top + sprite_get_height(sprite)*scale;
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), gui_left, gui_top, x2, y2)) {
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