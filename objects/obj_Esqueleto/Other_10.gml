// Variáveis do Inimigo
alcance_corpo = variable_struct_get(ESQUELETO, "alcance");
vida_total = variable_struct_get(ESQUELETO, "vida");
vida = vida_total;
vel = variable_struct_get(ESQUELETO, "vel");
dano = variable_struct_get(ESQUELETO, "dano");
peso_orda = variable_struct_get(ESQUELETO, "peso");

spr_colisao = spr_Esqueleto_mask_pes;
spr_andando = spr_Esqueleto_andando;
spr_atacando = spr_Esqueleto_atacando;
spr_morrendo = spr_Esqueleto_morrendo;
mask_index = spr_colisao;

// Estados do Inimigo (use enums para melhor organização)
estado = INIMIGOS_ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, false);
