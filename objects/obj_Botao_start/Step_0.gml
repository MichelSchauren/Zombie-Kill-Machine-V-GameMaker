// Detecta se o mouse tá em cima do sprite
if point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2) {
    // cresce suave
    image_xscale = lerp(image_xscale, 1.2, 0.2);
    image_yscale = lerp(image_yscale, 1.2, 0.2);
	
	if mouse_check_button_pressed(1) {
		room_goto(global.Mapa_atual);
	}
} else {
    // volta ao normal suave
    image_xscale = lerp(image_xscale, 1, 0.2);
    image_yscale = lerp(image_yscale, 1, 0.2);
}
