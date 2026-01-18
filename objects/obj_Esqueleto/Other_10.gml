// Variáveis do Inimigo
indice = 0;
alcance_corpo = ESQUELETO_ALCANCE_CORPO;
vida_total = ESQUELETO_VIDA_TOTAL;
vida = vida_total;
vel = ESQUELETO_VEL;
dano = ESQUELETO_DANO;

spr_colisao = spr_Esqueleto_mask_pes;
spr_andando = spr_Esqueleto_andando;
spr_atacando = spr_Esqueleto_atacando;
spr_morrendo = spr_Esqueleto_morrendo;
mask_index = spr_colisao;

// Estados do Inimigo (use enums para melhor organização)
estado = INIMIGOS_ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, false);
