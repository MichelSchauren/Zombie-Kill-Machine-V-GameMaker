if (mouse_check_button_pressed(mb_left)) {
	// START
	if (keyboard_check_pressed(vk_enter)) {
		obj_SND.UI_click2_sfx.play = true; // tocar som
		room_goto(Modos_de_jogo);
	}
	// OPTIONS
	if (keyboard_check_pressed(ord("O"))) {
		obj_SND.UI_click2_sfx.play = true; // tocar som
		room_goto(Options);
	}
	// CREDITS
	if (keyboard_check_pressed(ord("C"))) {
		obj_SND.UI_click2_sfx.play = true; // tocar som
		room_goto(Credits);
	}
}