z = y - y_real;
vel = struct_get(TORRE_ARQUEIRA[level], "vel");
dano = struct_get(TORRE_ARQUEIRA[level], "dano");
image_index = level;

parado = false;
alarm[1] = game_get_speed(gamespeed_fps) * 5;

var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);
if (_dist_player <= 700) {
	obj_SND.flecha_sfx.play = true; // som
}