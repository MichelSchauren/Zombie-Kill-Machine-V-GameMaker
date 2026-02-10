var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);

if (!show) {
	if (_dist_player <= alcance) {
		show = true;
		obj_Player.estado = noone; // impedir player de se mover
	}
} else {
	show = false;
	obj_Player.estado = PL_ESTADOS.PARADO;
}