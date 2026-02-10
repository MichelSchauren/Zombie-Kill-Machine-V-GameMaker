// Calcular a distância até o inimigo mais próximo
var _inimigo = noone;
var _dist_player = alcance+1;

for (var i = 0; i < instance_number(obj_Inimigo); i++) {
	var _enemy = instance_find(obj_Inimigo, i);
	var _dist = point_distance(x, y, _enemy.x, _enemy.y);
	
	if ((_dist < _dist_player) and _enemy.vida > 0) { // Apenas inimigos vivos
		_dist_player = _dist;
		_inimigo = _enemy;
	}
}

switch (estado) {
	case ARQ_ESTADOS.VIGIANDO:
		// Se há algum inimigo perto -> atirar nele
		if (_inimigo) {
			image_speed = 1;
			
			if (image_index >= image_number-1) {
				// começar a atirar
				estado = ARQ_ESTADOS.ATIRANDO;
				image_speed = 1;
				sprite_index = spr_Arqueiro1_atirando;
				image_index = 0;
			}
		} else {
			image_speed = 0;
		}
			
		break;
		
	case ARQ_ESTADOS.ATIRANDO:
		if (_inimigo) {
			image_xscale = sign(_inimigo.x - x);
			
			// atirar
			if (image_index >= image_number-1) {
				
				// -((_dist*_grav)/(2*variable_struct_get(FLEXA, "vel")/fps) - _grav/2)
				var _dir = point_direction(x, y_real, _inimigo.x, _inimigo.y);
				var _x = x + lengthdir_x(108, _dir);
				var _y = y_real + lengthdir_y(108, _dir);
				var _dist = point_distance(_x, _y, _inimigo.x, _inimigo.y);
				var _grav = 0.5;
				var _t = _dist / (variable_struct_get(FLEXA, "vel")/fps);
				var _vz_init = (altura - (_grav * (_t*_t)) /2) / _t;

				var _params = {"y_real": _y, "vel_z": _vz_init, "gravidade": _grav};
				var _flecha = instance_create_layer(_x, _y-altura-50, "Projeteis", obj_Flecha, _params);
				_flecha.direction = _dir;
				_flecha.target = _inimigo;
				
				image_index = 0;
			}
		} else {
			// mudar para o estado de vigia
			estado = ARQ_ESTADOS.VIGIANDO;
			sprite_index = spr_Arqueiro1_parado;
			image_speed = 0;
			image_index = 0;
		}
		
		break;
}