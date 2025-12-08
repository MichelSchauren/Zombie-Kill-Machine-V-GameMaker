// No Evento Step
// Se clicar com o mouse (ex: no objeto) para começar a digitar
if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
    selecionado = true;
    keyboard_string = ""; // Limpa a string ao começar
} else {
	selecionado = false;
}

if (selecionado) {
    // Adiciona o que foi digitado na string
    texto = keyboard_string;

    // Enter - Sair
    if (keyboard_check_pressed(vk_enter) or keyboard_check(vk_return)) {
        selecionado = false;
        keyboard_string = ""; // Limpa para a próxima vez
    }
    // Backspace - Apagar
    if (keyboard_check_pressed(vk_backspace)) {
        if (string_length(keyboard_string) > 0) {
            keyboard_string = string_delete(keyboard_string, string_length(keyboard_string), 1);
            texto = keyboard_string;
        }
    }
}
