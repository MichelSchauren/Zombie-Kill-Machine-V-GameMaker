// Variáveis do Inimigo
alcance_corpo = 0;
alcance_atirando = 0;
vida_total = 0;
vida = vida_total;
vel = 0;
dano = 0;

spr_colisao = noone;
spr_andando = noone;
spr_atacando = noone;
spr_morrendo = noone;
mask_index = noone;

projetil_instance = noone;
projetil_image_index = 0;

enum INIMIGOS_ESTADOS {
	PARADO,
	PERSEGUINDO,
	PERSEGUINDO_CORRENDO,
	ANDANDO,
	CORRENDO,
	ATACANDO,
	ATIRANDO,
	DASHANDO,
	EXPLODINDO,
	MORRENDO
}

estado = INIMIGOS_ESTADOS.PARADO; // Estado inicial

// Funções
perseguir = function (dist_player) {
	// Se estiver perto o suficiente, mudar para o estado de ataque
    if (dist_player <= alcance_corpo) {
        estado = INIMIGOS_ESTADOS.ATACANDO;
		sprite_index = spr_atacando; // Mudar sprite para atacando
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
}

atacar = function (dist_player) {
	// Se estiver na ultima imagem da sprite
    if (image_index = image_number -1) {
        // Diminuir a vida do player
        obj_Player.vida = max(obj_Player.vida - dano, 0);
    }

    // Se o player se afastar, voltar a perseguir
    if (dist_player > alcance_corpo) {
        estado = INIMIGOS_ESTADOS.PERSEGUINDO;
		sprite_index = spr_andando; // Mudar sprite para andando
		image_index = 0;
    }
}

morrer = function () {
	if (image_index >= image_number -1) {
		estado = noone;
		image_speed = 0;
		image_index = image_number -1;
		alarm[0] = game_get_speed(gamespeed_fps)*3; // ativar alarme 0 depois de 3 segundos
	}
}

event_user(0);