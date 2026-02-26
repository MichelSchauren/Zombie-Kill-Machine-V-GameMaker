if (pode_som) {
	var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);
	if (_dist_player < 650) {
		obj_SND.zombi3_sfx.play = true;
		pode_som = false;
	}
}