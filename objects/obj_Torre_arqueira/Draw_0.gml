draw_self();

// Desenhar texto "clique aqui"
if (!show) {
	var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);
	
	if (_dist_player <= dist_interface) {
		draw_set_colour(c_white);
		draw_set_font(font_Consolas_12);
		draw_set_halign(fa_center);
		
		if (global.Controller_mode == 2) { // Mobile
			draw_text(x, y-40, "Clique aqui!");
		} else {
			draw_text(x, y-40, "Pressione F");
		}	
	}
}

// Desenhar VIDA
var _larg_vida = (180*vida) / vars.vida;

// fundo da vida
draw_set_colour(c_red);
draw_rectangle(x-90, y-115 -vars.altura, x+90, y-100 -vars.altura, false);
// vida
draw_set_colour(c_green);
draw_rectangle(x-90, y-115 -vars.altura, x-90 + _larg_vida, y-100 -vars.altura, false);