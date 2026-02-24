// Variáveis do Inimigo
alcance_corpo = ZOMBI.alcance;
vida_total = ZOMBI.vida;
vida = vida_total;
vel = ZOMBI.vel;
dano = ZOMBI.dano;
peso_orda = ZOMBI.peso;

spr_colisao = spr_Zombi_mask_pes;
spr_andando = spr_Zombi_andando;
spr_atacando = spr_Zombi_atacando;
spr_morrendo = spr_Zombi_morrendo;
mask_index = spr_colisao;

// Estados do Inimigo (use enums para melhor organização)
estado = INIMIGOS_ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, false);
