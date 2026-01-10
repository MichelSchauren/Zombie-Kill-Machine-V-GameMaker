global.Onda_atual = 0;

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


pegar_pesos_reais = function (enemy, _) {
	return (enemy[0] <= global.Peso_orda and enemy[2] <= global.Onda_atual) ;
}
pesos_orda_reais = array_filter(global.Pesos_orda, pegar_pesos_reais);

spawnar_orda = function () {
	if (global.Spaw_inimigos) {
		var _peso = global.Peso_orda;
		var _pesos_orda_reais = array_filter(global.Pesos_orda, pegar_pesos_reais);
	
		while (_peso > 0) {
			// sortear inimigo
			var _i = irandom_range(0, array_length(_pesos_orda_reais)-1);
			var _peso_inimigo = _pesos_orda_reais[_i][0];
		
			if (_peso_inimigo <= _peso) { // se o inimigo sorteado tiver o peso mínimo
				_peso -= _peso_inimigo;
				var _inimigo = _pesos_orda_reais[_i][1];
				ds_list_add(global.Orda, _inimigo); // Adicionar inimigo a orda que será spawnada
			} else {
				array_delete(_pesos_orda_reais, _i, 1); // Para não sortear o mesmo inimigo novamente
			}
		}
	}
}