// Calcular a distância até o jogador (obj_Player)
var _pers_array = [obj_Player, obj_Outro, obj_Torre_arqueira];
var _perseguindo = noone;
var _dist_pers = -1;
for (var i = 0; i < array_length(_pers_array); i++) {
    var inst = instance_nearest(x, y, _pers_array[i]);
    
    if (instance_exists(inst)) {
        var _dist = distance_to_object(inst);
        
        // Se for a primeira instância encontrada ou estiver mais perto que a anterior
        if (_perseguindo == noone || _dist < _dist_pers) {
            _perseguindo = inst;
            _dist_pers = _dist;
        }
    }
}

switch (estado) {
	case INIMIGOS_ESTADOS.MORRENDO:
		morrer();
		break;
		
	case INIMIGOS_ESTADOS.PERSEGUINDO:
		perseguir(_dist_pers, _perseguindo);
        break;

    case INIMIGOS_ESTADOS.ATACANDO:
        atacar(_dist_pers, _perseguindo);
        break;
		
	case INIMIGOS_ESTADOS.ATIRANDO:
		// Se estiver na image correta para largar o projetil
        if (image_index = projetil_image_index) {
			var _x = x + 40*image_xscale;
			
            // Criar projetil
			var _params = {direction: point_direction(_x, y, _perseguindo.x, _perseguindo.y), image_xscale: image_xscale}
			f_criar_projetil(_x, y, projetil_instance, _params);
        }
		// Se estiver na ultima imagem da sprite
        if (image_index >= image_number -1) {
            estado = INIMIGOS_ESTADOS.PERSEGUINDO;
			sprite_index = spr_andando;
			image_speed = 1;
			image_index = 0;
        }
		break;
}

// Matar inimigo
if (spr_morrendo != noone and vida == 0 and estado != INIMIGOS_ESTADOS.MORRENDO and estado != noone) {
	estado = INIMIGOS_ESTADOS.MORRENDO;
	sprite_index = spr_morrendo; // Mudar sprite
	image_index = 0;
	image_speed = 1;
	speed = 0;
}