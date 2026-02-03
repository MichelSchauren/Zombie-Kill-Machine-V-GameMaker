// Resetar globais
global.Onda_atual = 0;
global.Peso_orda = 0;
ds_list_clear(global.Orda);

alarm[1] = 1; // Iniciar na transição de dia para noite

alpha = 0.25;
min_alpha = 0;
max_alpha = .75;
passo_alpha = .0025;
frames_alpha = 5;

surf_width = camera_get_view_width(view_camera[0]);
surf_height = camera_get_view_height(view_camera[0]);
surface = surface_create(surf_width, surf_height);

surface_set_target(surface);
draw_set_colour(c_black);
draw_rectangle(0, 0, surf_width, surf_height, false);
surface_reset_target();
draw_set_colour(-1);


// Spaw de inimigos
pegar_pesos_reais = function (enemy, _) {
	return (enemy[$ "peso"] <= global.Peso_orda and enemy[$ "orda"] <= global.Onda_atual) ;
}
pesos_orda_reais = array_filter(INIMIGOS, pegar_pesos_reais);

spawnar_orda = function () {
	if (global.Spaw_inimigos) {
		var _peso = global.Peso_orda;
		var _pesos_orda_reais = array_filter(INIMIGOS, pegar_pesos_reais);
	
		while (_peso > 0) {
			// sortear inimigo
			var _i = irandom_range(0, array_length(_pesos_orda_reais)-1);
			var _peso_inimigo = _pesos_orda_reais[_i][$ "peso"];
		
			if (_peso_inimigo <= _peso) { // se o inimigo sorteado tiver o peso mínimo
				_peso -= _peso_inimigo;
				var _inimigo = _pesos_orda_reais[_i][$ "obj"];
				ds_list_add(global.Orda, _inimigo); // Adicionar inimigo a orda que será spawnada
			} else {
				array_delete(_pesos_orda_reais, _i, 1); // Para não sortear o mesmo inimigo novamente
			}
		}
	}
}


// Pausar/Despausar tempo
tempo_atual = ds_list_create();
ds_list_add(tempo_atual, 0, 1, 0);

pausar = function (pause) {
	global.Tempo_pausado = pause;
	
	if (pause) {
		// armazanar tempo atual
		ds_list_insert(tempo_atual, 0, alarm_get(0));
		ds_list_insert(tempo_atual, 1, alarm_get(1));
		ds_list_insert(tempo_atual, 2, alarm_get(2));
	} else {
		// continuar ciclo das ondas apartir do tempo armazenado
		alarm[0] = ds_list_find_value(tempo_atual, 0);
		alarm[1] = ds_list_find_value(tempo_atual, 1);
		alarm[2] = ds_list_find_value(tempo_atual, 2);
	}
}

// pular onda
pular_onda = function () {
	alpha = 0;
	alarm[0] = 0;
	alarm[1] = 1;
	alarm[2] = 0;
}