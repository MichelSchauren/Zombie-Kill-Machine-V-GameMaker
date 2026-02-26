if (pode_som) {
	var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);
	if (_dist_player < 600) {
		obj_SND.zombi2_sfx.play = true;
		pode_som = false;
	}
}