if (keyboard_virtual_status()) { // Verifica se o teclado está aberto
    if (global.campo_ativo == "nome") {
        if (string_length(keyboard_string) > 13) {
            keyboard_string = string_copy(keyboard_string, 1, 13);
        }
        global.input_server_nome.texto = keyboard_string;
    }
    else if (global.campo_ativo == "jogadores") {
        global.input_server_jogadores.texto = string_digits(keyboard_string);
    }
}