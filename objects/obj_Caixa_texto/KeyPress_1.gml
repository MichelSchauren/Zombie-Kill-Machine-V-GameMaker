if (selecionado) {
    // Adiciona o que foi digitado na string
    texto = keyboard_string;

    // Enter - Sair
    if (keyboard_check_pressed(vk_enter) or keyboard_check(vk_return)) {
        selecionado = false;
		keyboard_string = ""; // limpa o keyboard
    }
    // Backspace - Apagar
    if (keyboard_check_pressed(vk_backspace)) {
        if (string_length(keyboard_string) > 0) {
            keyboard_string = string_delete(keyboard_string, -1, 0);
            texto = keyboard_string;
        }
    }
}