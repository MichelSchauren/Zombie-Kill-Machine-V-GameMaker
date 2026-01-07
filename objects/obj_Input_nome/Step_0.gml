// No Evento Step
if (global.Controller_mode == 0) {
	// Se clicar com o mouse (ex: no objeto) para começar a digitar
	if mouse_check_button_pressed(mb_left) {
		if point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
			selecionado = true;
			keyboard_string = global.Player_name; // atualiza o keyboard para ter o nome salvo
		} else {
			selecionado = false;
			keyboard_string = ""; // limpa o keyboard
		}
	}
}

// Se estiver no MOBILE
if (global.Controller_mode == 2) {
	if (device_mouse_check_button_pressed(0, mb_left)) {
		var gui_x = device_mouse_x_to_gui(0);
		var gui_y = device_mouse_y_to_gui(0);
		
		if point_in_rectangle(gui_x, gui_y, bbox_left, bbox_top, bbox_right, bbox_bottom) {
			// mostrar o teclado
			keyboard_virtual_show(kbv_type_default, kbv_autocapitalize_words, kbv_returnkey_done, false);
			selecionado = true;
			keyboard_string = global.Player_name; // atualiza o keyboard para ter o nome salvo
		} else {
			// fechar teclado
			keyboard_virtual_hide();
			selecionado = false
			keyboard_string = ""; // limpa o keyboard
		}
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
