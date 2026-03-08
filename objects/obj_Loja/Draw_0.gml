draw_self();

if (!show) {
	var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);
	
	if (_dist_player <= alcance) {
		draw_set_colour(c_white);
		draw_set_font(font_Consolas_12);
		draw_set_halign(fa_center);
		
		switch (global.Controller_mode) {
			case 0:
				draw_text(x, y-40, "Pressione F");
				break
			case 1:
				draw_text(x, y-40, "Pressione X");
				break;
			case 2:
				draw_text(x, y-40, "Clique aqui!");
				break;
		}
	}
}