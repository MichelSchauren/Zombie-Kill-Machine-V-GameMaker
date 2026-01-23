if (mouse_check_button_pressed(mb_left)) {
	// START
	if (keyboard_check_pressed(vk_enter)) {
		room_goto(Modos_de_jogo);
	}
	// OPTIONS
	if (keyboard_check_pressed(ord("O"))) {
		room_goto(Options);
	}
	// CREDITS
	if (keyboard_check_pressed(ord("C"))) {
		room_goto(Credits);
	}
}