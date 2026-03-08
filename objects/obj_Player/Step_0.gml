// DEFINIR ESTADO ATUAL
if (estado != noone) {
	var _estado_passado = estado;
	if (vida == 0 and !global.Player_imortal) {
		estado = PL_ESTADOS.MORRENDO;
	} else if (speed > 0) { // está se movendo
		if (press) { // está atirando
			estado = PL_ESTADOS.ATIRANDO_ANDANDO;
		} else { // não está correndo
			estado = PL_ESTADOS.CORRENDO;
		}
	} else { // não está se movendo
		if (press) {// está atirando
			estado = PL_ESTADOS.ATIRANDO;
		} else {// não está atirando
			estado = PL_ESTADOS.PARADO;
		}
	}
	// Se mudar o estado
	if (estado != _estado_passado) {
		image_index = 0;
	}
} else speed = 0; // morto não se mexe


// ESTADOS
switch (estado) {	
	case PL_ESTADOS.ATIRANDO_ANDANDO:
		sprite_index = spr_Player_atirandomov;
		if (dir_tiro < 90 or dir_tiro > 270) image_xscale = 1;
		else image_xscale = -1;
		vel = PLAYER_VEL_ATIRANDO;
		break;
		
	case PL_ESTADOS.CORRENDO:
		sprite_index = spr_Player_correndo;
		if (hspeed != 0) image_xscale = sign(hspeed);
		vel = PLAYER_VEL_CORRENDO;
		break;
		
	case PL_ESTADOS.ATIRANDO:
		sprite_index = spr_Player_atirando;
		if (dir_tiro < 90 or dir_tiro > 270) image_xscale = 1;
		else image_xscale = -1;
		break;
		
	case PL_ESTADOS.PARADO:
		sprite_index = spr_Player_parado;
		break;
		
	case PL_ESTADOS.MORRENDO:
		sprite_index = spr_Player_morrendo;
		speed = 0; // morto não se mexe
		if (image_index >= image_number -1) {
			estado = noone;
			image_speed = 0;
			image_index = image_number-1;
			alarm[1] = game_get_speed(gamespeed_fps)*3; // // Ir para a tela de gameover depois de 3 segundos
		}
		
		break;
}

// Mover
if (estado == PL_ESTADOS.CORRENDO or estado = PL_ESTADOS.ATIRANDO_ANDANDO) {
	// Mover caso não colida com as parede
	move_and_collide(lengthdir_x(speed*vel/fps, direction), lengthdir_y(speed*vel/fps, direction), [obj_Estruturas, obj_Colisores, obj_Colisor_player_24]);
	speed = 0; // Para não se mover no final do step
}

// Atirar
if (estado = PL_ESTADOS.ATIRANDO or estado = PL_ESTADOS.ATIRANDO_ANDANDO) {
	if (pode_atirar) {
		// resetar time do tiro
		if (global.Modo_desenvolvedor) tpf = game_get_speed(gamespeed_fps) / variable_struct_get(TIRO, "tps");
		alarm[0] = tpf;
		pode_atirar = false;
		
		// Definir a posição x do tiro de acordo com a direção do player
		var _x;
		if (image_xscale < 0) _x = x-28;
		else _x = x+28;
		var _y = y+9;
		
		var _params = {direction: dir_tiro};
		
		// Atirar
		f_criar_projetil(_x, _y, obj_Tiro, _params);
	}
}