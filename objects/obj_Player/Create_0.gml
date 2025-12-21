keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);

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