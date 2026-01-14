// Variáveis do Inimigo
alcance_corpo = 70;
alcance_atirando = 0;
vida_total = 40;
vida = vida_total;
vel = 3;
dano = 60;

spr_colisao = spr_Explosivo;
spr_andando = spr_Explosivo;
spr_atacando = spr_Explosivo;
spr_morrendo = spr_Explosivo;
mask_index = spr_Explosivo;

estado = INIMIGOS_ESTADOS.PERSEGUINDO; // Estado inicial

// Funções
perseguir = function (dist_player, amigo) {
	// Se estiver perto o suficiente, mudar para o estado de ataque
    if (dist_player <= alcance_corpo) {
        estado = INIMIGOS_ESTADOS.EXPLODINDO;
		sprite_index = spr_Explosivo_explodindo; // Mudar sprite para atacando
		image_index = 0;
    } else {
        // instance_nearest(); [anotação]
		// Perseguir o jogador desviando de obstáculos (obj_Colisores e obj_Inimigos)
		mp_potential_step(amigo.x, amigo.y, vel, false);
			
		// Virar a sprite na direção do movimento (opcional, para refletir horizontalmente)
		direction = point_direction(xprevious, yprevious, x, y);
		if ( direction > 90 && direction < 270) {
		    image_xscale = -1; // Vira para a esquerda
		} else {
		    image_xscale = 1; // Vira para a direita
		}
    }
}
