if (y < meta_y) { // Enquanto não estiver no chão
	x += vel_x/fps; // Movimento horizontal
	y = min(y + vel_y/fps, meta_y); // Movimento vertical
	vel_y += gravidade;
}

// Coletar moedas
with (obj_Player) {
	mask_index = sprite_index;
	if (place_meeting(x, y, other)) {
		global.Moedas += 1;
		instance_destroy(other);
		
		// MULTIPLAYER
		if (global.Multiplayer) {
			if (instance_exists(obj_Client_tcp)) obj_Client_tcp.coletei_moeda(other.moeda_id);
		}
	}
	mask_index = spr_colisao;
}