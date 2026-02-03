// Variáveis do Inimigo
alcance_corpo = variable_struct_get(TANQUE, "alcance");
vida_total = variable_struct_get(TANQUE, "vida");
vida = vida_total;
vel = variable_struct_get(TANQUE, "vel");
dano = variable_struct_get(TANQUE, "dano");
peso_orda = variable_struct_get(TANQUE, "peso");

spr_colisao = spr_Tanque_mask_pes;
spr_andando = spr_Tanque_andando;
spr_atacando = spr_Tanque_atacando;
spr_morrendo = spr_Tanque_morrendo;
mask_index = spr_colisao;

// Estados do Inimigo (use enums para melhor organização)
estado = INIMIGOS_ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, false);
