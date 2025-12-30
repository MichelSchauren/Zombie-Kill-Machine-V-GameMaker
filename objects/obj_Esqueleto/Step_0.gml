// Calcular a distância até o jogador (obj_Player)
var dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);

// Lógica da Máquina de Estados
switch (estado) {
    case ESTADOS.PERSEGUINDO:
        sprite_index = spr_Esqueleto_andando; // Mudar sprite para andando

        // Se estiver perto o suficiente, mudar para o estado de ataque
        if (dist_player <= alcance) {
            estado = ESTADOS.ATACANDO;
			sprite_index = spr_Esqueleto_atacando; // Mudar sprite para atacando
			image_index = 0;
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

    case ESTADOS.ATACANDO:
        // Se estiver na ultima imagem da sprite, dar dano
        if (image_index = image_number -1) {
            // Diminuir a vida do player
            obj_Player.vida = max(obj_Player.vida - global.Esqueleto_DANO, 0);
        }

        // Se o player se afastar, voltar a perseguir
        if (dist_player > alcance) { // Adiciona uma margem para evitar flicker de estados
            estado = ESTADOS.PERSEGUINDO;
			image_index = 0;
        }
        break;
		
	case ESTADOS.MORRENDO:
		if (image_index >= image_number -1) {
			image_speed = 0;
		}
}

// Matar esqueleto
if (vida == 0 and estado != ESTADOS.MORRENDO) {
	estado = ESTADOS.MORRENDO;
	sprite_index = spr_Esqueleto_morrendo; // Mudar sprite
	image_index = 0;
	speed = 0;
	alarm[1] = 150; // ativar alarme 1 depois de 150 frames
}
