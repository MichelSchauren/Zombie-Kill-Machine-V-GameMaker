// Detecta se o mouse tá em cima do sprite
if (collision_point(mouse_x, mouse_y, self, false, false)) {
    // cresce suave
    image_xscale = lerp(image_xscale, 1.2, 0.2);
    image_yscale = lerp(image_yscale, 1.2, 0.2);
	
	if mouse_check_button_pressed(mb_left) {
		room_goto(Credits);
	}
} else {
    // volta ao normal suave
    image_xscale = lerp(image_xscale, 1, 0.2);
    image_yscale = lerp(image_yscale, 1, 0.2);
}