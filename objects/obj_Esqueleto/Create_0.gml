// Variáveis do Inimigo
alcance = 60;
vida = global.Esqueleto_VIDA_TOTAL;
vel = global.Esqueleto_VEL;
hspeed = 0;
vspeed = 0;
spr_colisao = spr_Esqueleto_mask_pes;
mask_index = spr_colisao;

// Estados do Inimigo (use enums para melhor organização)
enum ESTADOS {
    PERSEGUINDO,
    ATACANDO,
	MORRENDO
}
estado = ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, false);
