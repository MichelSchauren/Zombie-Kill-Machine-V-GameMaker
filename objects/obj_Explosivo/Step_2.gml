switch (estado) {
	case INIMIGOS_ESTADOS.EXPLODINDO:
		// Se estiver na ultima imagem da sprite
        if (image_index = image_number -1) {
            // Diminuir a vida do player
			var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);
			if (_dist_player < alcance_corpo*2) {
				obj_Player.vida = max(obj_Player.vida - dano, 0);
			}
			instance_destroy();
        }
        break;
}