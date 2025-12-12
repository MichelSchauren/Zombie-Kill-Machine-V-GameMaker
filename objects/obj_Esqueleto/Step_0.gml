// Calcular a distância até o jogador (obj_Player)
var dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);

// Lógica da Máquina de Estados
switch (estado) {
    case ESTADOS.PERSEGUINDO:
        sprite_index = spr_Esqueleto_andando; // Mudar sprite para andando
		speed = global.Esqueleto_VEL; // Voltar a velocidade normal

        // Se estiver perto o suficiente, mudar para o estado de ataque
        if (dist_player <= alcance) {
            estado = ESTADOS.ATACANDO;
        } else {
            // Perseguir o jogador desviando de obstáculos (obj_Colisores)
            // mp_potential_step é ótimo para desviar de paredes sólidas em jogos top-down/2D abertos
            mp_potential_step(obj_Player.x, obj_Player.y, speed, false);
        }
        break;

    case ESTADOS.ATACANDO:
        sprite_index = spr_Esqueleto_atacando; // Mudar sprite para atacando
        speed = 0; // Parar de se mover durante o ataque

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

// Virar a sprite na direção do movimento (opcional, para refletir horizontalmente)
if (speed > 0) {
    if (point_direction(x, y, x + hspeed, y + vspeed) > 90 && point_direction(x, y, x + hspeed, y + vspeed) < 270) {
        image_xscale = -1; // Vira para a esquerda
    } else {
        image_xscale = 1; // Vira para a direita
    }
}

// Matar esqueleto
if (vida == 0 and estado != ESTADOS.MORRENDO) {
	estado = ESTADOS.MORRENDO;
	sprite_index = spr_Esqueleto_morrendo; // Mudar sprite
	speed = 0;
	alarm[1] = 150; // ativar alarme 1 depois de 150 frames
}
