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
chegou_player = function () {
	estado = INIMIGOS_ESTADOS.EXPLODINDO;
	sprite_index = spr_Explosivo_explodindo; // Mudar sprite para atacando
	image_index = 0;
}