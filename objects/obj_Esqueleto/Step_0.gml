dist_player = distance_to_object(obj_Player);

// atacar
if (dist_player < 60) {
	if sprite_index != spr_Esqueleto_atacando {
		sprite_index = spr_Esqueleto_atacando;
	} else if (image_index >= image_number-1) {
		show_debug_message("dano!");
	}
}