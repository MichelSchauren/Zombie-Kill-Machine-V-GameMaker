z = y - y_real;
target = noone;
vel = struct_get(TORRE_ARQUEIRA[level], "vel");
dano = struct_get(TORRE_ARQUEIRA[level], "dano");
image_index = level;

parado = false;
alarm[1] = game_get_speed(gamespeed_fps) * 5;

obj_SND.flecha_sfx.play = true; // som