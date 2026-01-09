// Calcular a distância até o jogador (obj_Player)
var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);

switch (estado) {
	case INIMIGOS_ESTADOS.MORRENDO:
		morrer();
		break;
		
	case INIMIGOS_ESTADOS.PERSEGUINDO:
		perseguir(_dist_player);
        break;

    case INIMIGOS_ESTADOS.ATACANDO:
        atacar(_dist_player);
        break;
		
	case INIMIGOS_ESTADOS.ATIRANDO:
		// Se estiver na image correta para largar o projetil
        if (image_index = projetil_image_index) {
			var _x = x + 40*image_xscale;
            // Criar instancia do projetil
            var _projetil = instance_create_layer(_x, y, "Projeteis", projetil);
			_projetil.direction = point_direction(_x, y, obj_Player.x, obj_Player.y);
			_projetil.image_xscale = image_xscale;
        }
		// Se estiver na ultima imagem da sprite
        if (image_index = image_number -1) {
            estado = INIMIGOS_ESTADOS.PERSEGUINDO;
			sprite_index = spr_andando;
			image_speed = 1;
			image_index = 0;
        }
		break;
}

// Matar inimigo
if (spr_morrendo != noone and vida == 0 and estado != INIMIGOS_ESTADOS.MORRENDO and estado != noone) {
	estado = INIMIGOS_ESTADOS.MORRENDO;
	sprite_index = spr_morrendo; // Mudar sprite
	image_index = 0;
	speed = 0;
}