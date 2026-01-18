if ((window_get_width() != last_width or window_get_height() != last_height) and window_get_width() != 0 and window_get_height() != 0) {
	redimencionar_tela();
	
	// Resetar os controles caso esteja no modo mobile
	if (global.Controller_mode == 2) f_Resetar_controles();
}
