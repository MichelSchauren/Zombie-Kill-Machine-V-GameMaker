var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);
if (_dist_player <= 700) {
	obj_SND.disparo_sfx.play = true; // som
}