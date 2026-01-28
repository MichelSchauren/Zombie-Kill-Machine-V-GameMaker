// Se estiver no MOBILE
if point_in_rectangle(mouse_x, mouse_y, x, y, x+100, y+25) {
	// mostrar o teclado
	keyboard_virtual_show(kbv_type_default, kbv_autocapitalize_words, kbv_returnkey_default, false);
	io_clear();
	selecionado = true;
	keyboard_string = texto; // atualiza o keyboard para ter o nome salvo
} else {
	// fechar teclado
	keyboard_virtual_hide();
	selecionado = false
	keyboard_string = ""; // limpa o keyboard
}