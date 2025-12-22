nome = "convidado";
vida = global.Player_VIDA_TOTAL;
morto = false;
movx = 0;
movy = 0;
vel = global.Player_VEL_CORRENDO;

pode_atirar = true;
tpf = game_get_speed(gamespeed_fps) / global.Tiro_TPS;

inputs = {
	up: vk_up,
	left: vk_left,
	down: vk_down,
	right: vk_right
}