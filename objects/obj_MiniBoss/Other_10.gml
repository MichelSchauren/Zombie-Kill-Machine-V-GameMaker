// Variáveis do Inimigo
alcance_corpo = MINIBOSS_ALCENCE_CORPO;
alcance_atirando = MINIBOSS_ALCENCE_ATIRANDO;
vida_total = MINIBOSS_VIDA_TOTAL;
vida = vida_total;
vel = MINIBOSS_VEL;
dano = MINIBOSS_DANO_CORPO;

spr_colisao = spr_MiniBoss_mask_pes;
spr_andando = spr_MiniBoss_andando;
spr_atacando = spr_MiniBoss_atacando;
spr_morrendo = spr_MiniBoss_morrendo;
mask_index = spr_colisao;

projetil = obj_Maxado_miniboss;
projetil_image_index = 6;

// Estados do Inimigo (use enums para melhor organização)
estado = INIMIGOS_ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, false);

pode_atirar = false;