level = 0;
vars = TORRE_ARQUEIRA[level];
y_real = y;
alcance = vars.alcance;
depth = obj_DepthSorting.entidades_depth - y_real -1;

sprites = [
	{"atirando": spr_Arqueiro1_atirando, "parado": spr_Arqueiro1_parado},
	{"atirando": spr_Arqueiro2_atirando, "parado": spr_Arqueiro2_parado},
	{"atirando": spr_Arqueiro3_atirando, "parado": spr_Arqueiro3_parado},
	{"atirando": spr_Arqueiro4_atirando, "parado": spr_Arqueiro4_parado},
	{"atirando": spr_Arqueiro5_atirando, "parado": spr_Arqueiro5_parado},
]
spr_atirando = sprites[level].atirando;
spr_parado = sprites[level].parado;

enum ARQ_ESTADOS {
	VIGIANDO,
	ATIRANDO
}
estado = ARQ_ESTADOS.VIGIANDO;

evoluir_level = function () {
	// Multiplayer
	if (global.Multiplayer) {
		var _buffer = obj_Client_tcp.client_buffer;
		buffer_seek(_buffer, buffer_seek_start, 0);
		buffer_write(_buffer, buffer_u8, Events_client_server.evolui_torre);
		buffer_write(_buffer, buffer_u8, indice);
		buffer_write(_buffer, buffer_u8, 1);
		buffer_write(_buffer, buffer_u8, level+1);
	
		network_send_packet(obj_Client_tcp.socket_tcp, _buffer, buffer_tell(_buffer));
		
	} else { // normal
		if (global.Moedas >= vars.preco and level < 4) {
			global.Moedas -= vars.preco;
		
			level += 1;
			vars = TORRE_ARQUEIRA[level];
		
			spr_atirando = sprites[level].atirando;
			spr_parado = sprites[level].parado;
	
			estado = ARQ_ESTADOS.VIGIANDO;
			sprite_index = spr_parado;
			image_index = 0;
			image_speed = 0;
		}
	}
}

evoluir = function (l) {
	if (l <= 4) {
		level = l;
		vars = TORRE_ARQUEIRA[level];
		
		spr_atirando = sprites[level].atirando;
		spr_parado = sprites[level].parado;
	
		estado = ARQ_ESTADOS.VIGIANDO;
		sprite_index = spr_parado;
		image_index = 0;
		image_speed = 0;
	}
}