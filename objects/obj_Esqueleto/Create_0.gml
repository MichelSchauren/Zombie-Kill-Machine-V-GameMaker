// Variáveis do Inimigo
alcance = 60;
pode_atacar = true; // Flag para controlar o cooldown do ataque
ataque_cooldown = 60; // Cooldown de 1 segundo (assumindo 60 FPS)
vida = global.Esqueleto_VIDA_TOTAL;
hspeed = 0;
vspeed = 0;
vel = global.Esqueleto_VEL;

// Estados do Inimigo (use enums para melhor organização)
enum ESTADOS {
    PERSEGUINDO,
    ATACANDO,
	MORRENDO
}
estado = ESTADOS.PERSEGUINDO; // Estado inicial

mp_potential_settings(90, 10, 8, 0);
