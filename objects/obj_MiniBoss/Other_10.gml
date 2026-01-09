// Variáveis do Inimigo
alcance_corpo = global.MiniBoss_ALCENCE_CORPO;
alcance_atirando = global.MiniBoss_ALCENCE_ATIRANDO;
vida_total = global.MiniBoss_VIDA_TOTAL;
vida = vida_total;
vel = global.MiniBoss_VEL;
dano = global.MiniBoss_DANO_CORPO;

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