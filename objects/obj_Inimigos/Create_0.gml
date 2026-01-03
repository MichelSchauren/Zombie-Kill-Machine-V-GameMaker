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
	EXPLODINDO,
	MORRENDO
}

estado = INIMIGOS_ESTADOS.PARADO; // Estado inicial

// Funções
chegou_player = function () {
	estado = INIMIGOS_ESTADOS.ATACANDO;
	sprite_index = spr_atacando; // Mudar sprite para atacando
	image_index = 0;
}

saiu_player = function () {
	estado = INIMIGOS_ESTADOS.PERSEGUINDO;
	sprite_index = spr_andando; // Mudar sprite para andando
	image_index = 0;
}

event_user(0);