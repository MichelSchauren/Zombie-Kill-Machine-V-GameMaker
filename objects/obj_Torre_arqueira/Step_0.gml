// Mostrando interface
if (show) {
	for (var i=0; i < array_length(janela); i++) {
		with (janela[i]) {
			if (fclick > -1) fclick--;
			
			if (fclick == 0) {
				image = 0; // volta ao normal
				fclick = -1;
				if (funcao) funcao();
			}
		}
	}
}

if (vida == 0) {
	if (!destruindo) {
		destruindo = true;
		sprite_index = sprs_destruindo[level];
		image_index = 0;
		instance_destroy(arqueiro);
		
	} else if (image_index >= image_number-1) {
		// Refazer espaço para construção
		var _instance = instance_create_layer(x, y, "Estruturas", obj_Espaco_torre, {indice: indice});
		ds_list_insert(global.Torres_list, indice, _instance);
		instance_destroy();
	}
}