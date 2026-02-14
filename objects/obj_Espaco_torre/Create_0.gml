alcance = 200;
show = false;

scale = 1;
gui_x = 0;
gui_y = 0;

torres = [ // {sprite, image, custo}
	{"sprite": spr_Select_torre_arqueira, "image": 0, "custo": 0, "fclick": 0, "x1": 0, "y1": 0},
]

redimencionar = function () {
	scale = min(display_get_gui_width()/960, display_get_gui_height()/540);
	gui_x = (display_get_gui_width() / 2) - (292 * scale);
	gui_y = (display_get_gui_height() / 2) - (191 * scale);

	var _colunas = 4;
	var l = 0;
	var c = 0;
	for (var i=0; i < array_length(torres); i++) {
		with (torres[i]) {
			x1 = other.gui_x + (40 + c * 128) * other.scale;
			y1 = other.gui_y + (60 + l * 77) * other.scale;
			x2 = x1 + sprite_get_width(sprite)*other.scale;
			y2 = y1 + sprite_get_height(sprite)*other.scale;
		}
		
		if ((i+1) mod _colunas == 0 and i != 0) {
			l++;
			c -= _colunas;
		}
		c++;
	}
}
redimencionar();