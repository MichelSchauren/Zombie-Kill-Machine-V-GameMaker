if (mouse_check_button_pressed(mb_left)) {
	// SOLO
	if (keyboard_check_pressed(ord("S"))) {
		room_goto(global.Mapa_atual);
	}
	// MULTIPLAYER
	if (keyboard_check_pressed(ord("M"))) {
		room_goto(Menu_Multiplayer);
	}
}