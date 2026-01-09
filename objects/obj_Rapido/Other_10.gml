// Variáveis do Inimigo
alcance_corpo = global.Rapido_ALCANCE_CORPO;
vida_total = global.Rapido_VIDA_TOTAL;
vida = vida_total;
vel = global.Rapido_VEL;
dash_vel = global.Rapido_DASH_VEL;
dash_direction = 0;
dano = global.Rapido_DANO;

spr_colisao = spr_Rapido_mask_pes;
spr_andando = spr_Rapido_andando;
spr_atacando = spr_Rapido_atacando;
spr_morrendo = spr_Rapido_morrendo;
mask_index = spr_colisao;

estado = INIMIGOS_ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, false);

atacar = function (dist_player) {
	// Se estiver na ultima imagem da sprite
    if (image_index = image_number -1) {
		// Dar dash
		estado = INIMIGOS_ESTADOS.DASHANDO;
		image_speed = 0;
		dash_direction = point_direction(x, y, obj_Player.x, obj_Player.y);
		// Virar a sprite na direção do dash
		if (dash_direction > 90 and dash_direction < 270) {
		    image_xscale = -1; // Vira para a esquerda
		} else {
		    image_xscale = 1; // Vira para a direita
		}
    }
}