level = 0;
vars = TORRE_ARQUEIRA[level];
vida = vars.vida;

// Calcula a profundidade com base altura em relação a room
depth = obj_DepthSorting.entidades_depth - y;
solid = true;

// sprites destruindo
sprs_destruindo = [
	spr_Torre_arqueira1_destruindo,
	spr_Torre_arqueira2_destruindo,
	spr_Torre_arqueira3_destruindo,
	spr_Torre_arqueira4_destruindo,
	spr_Torre_arqueira5_destruindo
]
destruindo = false;

// Criar arqueiro
arqueiro = instance_create_layer(x, y, "Personagens", obj_Arqueiro, {indice: indice});
with (arqueiro) {
	y = y_real - other.vars.altura;
}

evoluir_level = function () {
	if (global.Moedas >= vars.preco and level < 4) {
		global.Moedas -= vars.preco;
	
		// Multiplayer
		if (global.Multiplayer) {
			var _buffer = obj_Client_tcp.client_buffer;
			buffer_seek(_buffer, buffer_seek_start, 0);
			buffer_write(_buffer, buffer_u8, Events_client_server.evolui_torre);
			buffer_write(_buffer, buffer_u8, indice);
			buffer_write(_buffer, buffer_u8, 0);
			buffer_write(_buffer, buffer_u8, level+1);
		
			network_send_packet(obj_Client_tcp.socket_tcp, _buffer, buffer_tell(_buffer));
		
		} else { // normal
			level += 1;
			vars = TORRE_ARQUEIRA[level];
			image_index = level;
			vida = vars.vida;
		
			with (arqueiro) {
				y = y_real - other.vars.altura;
				alcance = other.vars.alcance;
			}
		}
	}
}

evoluir = function (l) {
	if (l <= 4) {
		level = l;
		vars = TORRE_ARQUEIRA[level];
		image_index = level;
		vida = vars.vida;
		
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