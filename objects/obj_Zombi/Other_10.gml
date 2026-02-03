// Variáveis do Inimigo
alcance_corpo = variable_struct_get(ZOMBI, "alcance");
vida_total = variable_struct_get(ZOMBI, "vida");
vida = vida_total;
vel = variable_struct_get(ZOMBI, "vel");
dano = variable_struct_get(ZOMBI, "dano");
peso_orda = variable_struct_get(ZOMBI, "peso");

spr_colisao = spr_Zombi_mask_pes;
spr_andando = spr_Zombi_andando;
spr_atacando = spr_Zombi_atacando;
spr_morrendo = spr_Zombi_morrendo;
mask_index = spr_colisao;

// Estados do Inimigo (use enums para melhor organização)
estado = INIMIGOS_ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, false);
