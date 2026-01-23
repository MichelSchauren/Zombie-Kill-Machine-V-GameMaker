// No Evento Step
if (selecionado) {
    // Adiciona o que foi digitado na string
	if (string_length(keyboard_string) <= max_caracteres) {
		texto = keyboard_string;
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
			if (string_length(keyboard_string) > max_caracteres) keyboard_string = texto;
            keyboard_string = string_delete(keyboard_string, -1, 0);
            texto = keyboard_string;
        }
    }
}
