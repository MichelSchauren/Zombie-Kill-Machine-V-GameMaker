if (vida == 0 and sprite_index == spr_morrendo and vivo) {
	if (image_index >= image_number -1) {
		image_index = image_number -1;
		vivo = false;
		alarm[0] = game_get_speed(gamespeed_fps)*3; // ativar alarme 0 depois de 3 segundos
	}
}