if (keyboard_check_pressed(vk_f11) or (keyboard_check(vk_alt) and keyboard_check_pressed(vk_enter))) {
	if (window_get_fullscreen()) {
		window_set_fullscreen(false);
	} else {
		window_set_fullscreen(true);
	}
}
