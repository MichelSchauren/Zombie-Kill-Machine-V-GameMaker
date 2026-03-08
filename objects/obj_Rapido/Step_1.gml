if (estado == INIMIGOS_ESTADOS.DASHANDO) {
	var _movx = lengthdir_x(v/fps, dash_direction);
	var _movy = lengthdir_y(v/fps, dash_direction);
	var _colididos = move_and_collide(_movx, _movy, [obj_Player, obj_Outro, obj_Colisores, obj_Estruturas]);
	
	if (array_length(_colididos) > 0) {
		var _alvo = _colididos[0];
		with (_alvo) {
			if (global.Multiplayer_adm) {
				if (object_index == obj_Outro) {
					obj_Server.inimigo_deu_dano(client_id, other.dano);
				} else if (object_index == obj_Torre_arqueira) {
					obj_Server.atualizar_vida_torre(indice, vida - other.dano);
				}
			} else {
				vida = max(vida - other.dano, 0);
			}
		}
		
		// Coldown para voltar a perseguir
		alarm[1] = game_get_speed(gamespeed_fps); // 1 segundo
		estado = noone;
		image_index = 0;
	}
}