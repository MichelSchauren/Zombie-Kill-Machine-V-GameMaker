// Variáveis do Inimigo
alcance_corpo = variable_struct_get(MINIBOSS, "alcance");
alcance_atirando = variable_struct_get(MINIBOSS, "alcance_atirando");
vida_total = variable_struct_get(MINIBOSS, "vida");
vida = vida_total;
vel = variable_struct_get(MINIBOSS, "vel");
dano = variable_struct_get(MINIBOSS, "dano");
peso_orda = variable_struct_get(MINIBOSS, "peso");

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