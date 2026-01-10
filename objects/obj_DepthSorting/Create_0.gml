escala = 100 / room_height;

personagens_depth = layer_get_depth("Personagens");

// Gerar lista com todas as layers das estruturas
layers_estruturas = ds_list_create();
var _layers = layer_get_all();

for (var i=0; i < array_length(_layers); i++) {
	var _layer_id = _layers[i];
	var _layer_name = layer_get_name(_layer_id);
	
	if (string_pos("Estruturas", _layer_name) == 1) {
		ds_list_add(layers_estruturas, _layer_id);
	}
}