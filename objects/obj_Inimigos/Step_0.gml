// Calcular a distância até o jogador (obj_Player)
var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);

switch (estado) {
	case INIMIGOS_ESTADOS.MORRENDO:
		if (image_index >= image_number -1) {
			estado = noone;
			image_speed = 0;
			image_index = image_number -1;
			alarm[0] = game_get_speed(gamespeed_fps)*3; // ativar alarme 0 depois de 3 segundos
		}
		break;
		
	case INIMIGOS_ESTADOS.PERSEGUINDO:
        // Se estiver perto o suficiente, mudar para o estado de ataque
        if (_dist_player <= alcance_corpo) {
            chegou_player();
        } else {
            // instance_nearest(); [anotação]
			// Perseguir o jogador desviando de obstáculos (obj_Colisores e obj_Inimigos)
			mp_potential_step(obj_Player.x, obj_Player.y, vel, false);
			
			// Virar a sprite na direção do movimento (opcional, para refletir horizontalmente)
			direction = point_direction(xprevious, yprevious, x, y);
			if ( direction > 90 && direction < 270) {
		        image_xscale = -1; // Vira para a esquerda
		    } else {
		        image_xscale = 1; // Vira para a direita
		    }
        }
        break;

    case INIMIGOS_ESTADOS.ATACANDO:
        // Se estiver na ultima imagem da sprite
        if (image_index = image_number -1) {
            // Diminuir a vida do player
            obj_Player.vida = max(obj_Player.vida - dano, 0);
        }

        // Se o player se afastar, voltar a perseguir
        if (_dist_player > alcance_corpo) {
            saiu_player();
        }
        break;
		
	case INIMIGOS_ESTADOS.ATIRANDO:
		// Se estiver na image correta para largar o projetil
        if (image_index = projetil_image_index) {
			var _x = x + 40*image_xscale;
            // Criar instancia do projetil
            var _projetil = instance_create_layer(_x, y, "Projeteis", projetil);
			_projetil.direction = point_direction(_x, y, obj_Player.x, obj_Player.y);
        }
		// Se estiver na ultima imagem da sprite
        if (image_index = image_number -1) {
            estado = INIMIGOS_ESTADOS.PERSEGUINDO;
			sprite_index = spr_andando;
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