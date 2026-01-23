if (window_get_width() != last_width or window_get_height() != last_height) {
	redimencionar_tela();
	
	// Resetar os controles caso esteja no modo mobile
	if (global.Controller_mode == 2) f_Resetar_controles();
	if (instance_exists(obj_Loja)) obj_Loja.redimencionar();
}
