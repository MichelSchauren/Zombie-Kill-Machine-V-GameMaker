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
	move_and_collide(lengthdir_x(speed*vel, direction), lengthdir_y(speed*vel, direction), [obj_Estruturas, obj_Colisores, obj_Colisor_player_24]);
	speed = 0; // Para não se mover no final do step
}

// Atirar
if (estado = PL_ESTADOS.ATIRANDO or estado = PL_ESTADOS.ATIRANDO_ANDANDO) {
	if (pode_atirar) {
		// resetar time do tiro
		alarm[0] = tpf;
		pode_atirar = false;
		
		// Definir a posição x do tiro de acordo com a direção do player
		var _x;
		if (image_xscale < 0) _x = x-28;
		else _x = x+28;
		
		// Atirar
		if (global.Multiplayer) {
			// Avisar server de que um novo tiro foi criado
			var _buffer = obj_Client_tcp.client_buffer;
			buffer_seek(_buffer, buffer_seek_start, 0);
			buffer_write(_buffer, buffer_u8, Events_client_server.tiro_player);
			buffer_write(_buffer, buffer_u16, _x);
			buffer_write(_buffer, buffer_u16, y+9);
			buffer_write(_buffer, buffer_u16, dir_tiro);
			network_send_packet(obj_Client_tcp.socket_tcp, _buffer, buffer_tell(_buffer));
		} else {
			// Criar tiro normalmente
			var _tiro = noone;
			_tiro = instance_create_layer(_x, y+9, "Projeteis", obj_Tiro);
			_tiro.direction = dir_tiro;
		}
	}
}