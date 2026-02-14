z = y - y_real;
target = noone;
vel = struct_get(TORRE_ARQUEIRA[level], "vel");
dano = struct_get(TORRE_ARQUEIRA[level], "dano");

parado = false;
alarm[1] = game_get_speed(gamespeed_fps) * 5;