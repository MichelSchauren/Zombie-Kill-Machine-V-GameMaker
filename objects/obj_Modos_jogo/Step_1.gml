if (mouse_check_button_pressed(mb_left)) {
	// SOLO
	if (keyboard_check_pressed(ord("S"))) {
		obj_SND.UI_click2_sfx.play = true; // tocar som
		room_goto(global.Mapa_atual);
	}
	// MULTIPLAYER
	if (keyboard_check_pressed(ord("M"))) {
		obj_SND.UI_click2_sfx.play = true; // tocar som
		room_goto(Menu_Multiplayer);
	}
}