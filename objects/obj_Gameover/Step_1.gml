if (mouse_check_button_pressed(mb_left)) {
	// MENU
	if (keyboard_check_pressed(vk_escape)) {
		room_goto(Menu);
		obj_SND.UI_click2_sfx.play = true; // tocar som
	}
}