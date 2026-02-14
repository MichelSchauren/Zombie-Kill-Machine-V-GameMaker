// Variáveis do Inimigo
alcance_corpo = ZOMBIGIRL.alcance;
vida_total = ZOMBIGIRL.vida;
vida = vida_total;
vel = ZOMBIGIRL.vel;
dano =ZOMBIGIRL.dano;
peso_orda = ZOMBIGIRL.peso;

spr_colisao = spr_ZombiGirl_mask_pes;
spr_andando = spr_ZombiGirl_andando;
spr_atacando = spr_ZombiGirl_atacando;
spr_morrendo = spr_ZombiGirl_morrendo;
mask_index = spr_colisao;

// Estados do Inimigo (use enums para melhor organização)
estado = INIMIGOS_ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, false);
