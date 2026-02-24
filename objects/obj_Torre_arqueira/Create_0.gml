level = 0;
vars = TORRE_ARQUEIRA[level];
vida = vars.vida;

// Calcula a profundidade com base altura em relação a room
depth = obj_DepthSorting.entidades_depth - y;
solid = true;

// Criar arqueiro
arqueiro = instance_create_layer(x, y, "Personagens", obj_Arqueiro);
with (arqueiro) {
	y = y_real - other.vars.altura;
}

evoluir_level = function () {
	if (global.Moedas >= vars.preco and level < 4) {
		global.Moedas -= vars.preco;
		
		level += 1;
		vars = TORRE_ARQUEIRA[level];
		image_index = level;
		
		with (arqueiro) {
			y = y_real - other.vars.altura;
		}
	}
}

var _fechar = function () {
	show = false;
	obj_Player.estado = PL_ESTADOS.PARADO;
}

// Interface
dist_interface = 200;
show = false;
scale = 1;
gui_x = 0;
gui_y = 0;

janela = [ // {sprite, image, funcao}
	{sprite: spr_Botao_x, image: 0, fclick: -1, x: 495, y: 6, funcao: _fechar},
	{sprite: spr_Botao_upgrade, image: 0, fclick: -1, x: 72, y: 300, funcao: evoluir_level},
	{sprite: spr_Botao_upgrade, image: 0, fclick: -1, x: 320, y: 300, funcao: arqueiro.evoluir_level}
]

redimencionar = function () {
	scale = min(display_get_gui_width()/960, display_get_gui_height()/540);
	gui_x = (display_get_gui_width() / 2) - (267 * scale);
	gui_y = (display_get_gui_height() / 2) - (198 * scale);

	for (var i=0; i < array_length(janela); i++) {
		with (janela[i]) {
			x1 = other.gui_x + x * other.scale;
			y1 = other.gui_y + y * other.scale;
			x2 = x1 + sprite_get_width(sprite)* other.scale;
			y2 = y1 + sprite_get_height(sprite)* other.scale;
		}
	}
}
redimencionar();