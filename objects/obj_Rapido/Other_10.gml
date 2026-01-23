// Variáveis do Inimigo
alcance_corpo = RAPIDO_ALCANCE_CORPO;
vida_total = RAPIDO_VIDA_TOTAL;
vida = vida_total;
vel = RAPIDO_VEL;
dash_vel = RAPIDO_DASH_VEL;
dash_direction = 0;
dano = RAPIDO_DANO;
peso_orda = RAPIDO_PESO_ORDA;

spr_colisao = spr_Rapido_mask_pes;
spr_andando = spr_Rapido_andando;
spr_atacando = spr_Rapido_atacando;
spr_morrendo = spr_Rapido_morrendo;
mask_index = spr_colisao;

estado = INIMIGOS_ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, false);

atacar = function (dist_player, amigo) {
	// Se estiver na ultima imagem da sprite
    if (image_index >= image_number -1) {
		image_index = image_number -1;
		// Dar dash
		estado = INIMIGOS_ESTADOS.DASHANDO;
		image_speed = 0;
		dash_direction = point_direction(x, y, amigo.x, amigo.y);
		// Virar a sprite na direção do dash
		if (dash_direction > 90 and dash_direction < 270) {
		    image_xscale = -1; // Vira para a esquerda
		} else {
		    image_xscale = 1; // Vira para a direita
		}
    }
}