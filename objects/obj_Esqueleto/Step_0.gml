// Calcular a distância até o jogador (obj_Player)
var dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);

// Lógica da Máquina de Estados
switch (estado) {
    case ESTADOS.PERSEGUINDO:
        sprite_index = spr_Esqueleto_andando; // Mudar sprite para andando

        // Se estiver perto o suficiente, mudar para o estado de ataque
        if (dist_player <= alcance) {
            estado = ESTADOS.ATACANDO;
        } else {
            // instance_nearest(); [anotação]
			// Mudar mask para detectar colisão nos pés
			var mask_original = mask_index;
			mask_index = spr_Esqueleto_mask_pes;
			// Perseguir o jogador desviando de obstáculos (obj_Colisores)
			mp_potential_step(obj_Player.x, obj_Player.y, vel, false);
			
			// Virar a sprite na direção do movimento (opcional, para refletir horizontalmente)
			var _direcao = point_direction(xprevious, yprevious, x, y);
			if ( _direcao > 90 && _direcao < 270) {
		        image_xscale = -1; // Vira para a esquerda
		    } else {
		        image_xscale = 1; // Vira para a direita
		    }
			
			// Se após o movimento ele colidiu com a parede, volta para a posição anterior
			if (place_meeting(x, y, obj_Colisores)) {
				x = xprevious;
				y = yprevious;
			}
			
			mask_index = mask_original;
        }
        break;

    case ESTADOS.ATACANDO:
        sprite_index = spr_Esqueleto_atacando; // Mudar sprite para atacando

        // Se o ataque for possível (sem cooldown), dar dano
        if (pode_atacar) {
            // Diminuir a vida do player
            obj_Player.vida = max(obj_Player.vida - global.Esqueleto_DANO, 0);
            pode_atacar = false;
            alarm[0] = ataque_cooldown; // Iniciar o cooldown do ataque
        }

        // Se o player se afastar, voltar a perseguir
        if (dist_player > alcance) { // Adiciona uma margem para evitar flicker de estados
            estado = ESTADOS.PERSEGUINDO;
        }
        break;
		
	case ESTADOS.MORRENDO:
		if (image_index >= image_number -1) {
			image_speed = 0
		}
}

// Matar esqueleto
if (vida == 0 and estado != ESTADOS.MORRENDO) {
	estado = ESTADOS.MORRENDO;
	sprite_index = spr_Esqueleto_morrendo; // Mudar sprite
	speed = 0;
	alarm[1] = 150; // ativar alarme 1 depois de 150 frames
}
