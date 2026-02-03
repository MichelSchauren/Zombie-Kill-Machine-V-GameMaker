moeda_id = noone;
depth = layer_get_depth("Estruturas") - y;
vel_x = random_range(-60, 60);
meta_y = y -20;
vel_y = -280;
gravidade = 9.8; // gravidade da terra (9.807 m/s) :)
y -= 40;

// Alarme para destruir moeda
alarm[0] = game_get_speed(gamespeed_fps) * 30; // 30 seg


// MULTIPLAYER
if (global.Multiplayer and global.Multiplayer_adm) {
	moeda_id = string(id);
	if (instance_exists(obj_Client_tcp)) struct_set(obj_Client_tcp.moedas_struct, moeda_id, self);
	if (instance_exists(obj_Server)) obj_Server.criar_moeda(self);
}