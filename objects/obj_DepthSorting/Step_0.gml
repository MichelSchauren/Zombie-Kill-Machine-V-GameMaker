// Profundidade dos personagens
with (obj_Personagens) {
	var _depth_layer = other.personagens_depth;

	// Verificar cada camada de estruturas
	for (var i=0; i < ds_list_size(other.layers_estruturas); i++) {
		var _layer_estruturas = ds_list_find_value(other.layers_estruturas, i);
		var _tilemap = layer_tilemap_get_id(_layer_estruturas);
		
		// Se a parte de baixo do personagem colidir com uma estrutura
		if (collision_line(bbox_left, bbox_bottom, bbox_right, bbox_bottom, _tilemap, false, false)) {
			_depth_layer = layer_get_depth(_layer_estruturas);
		}
	}
	
	// Calcula a profundidade com base nas estruturas e outros personagens
	depth = _depth_layer +100 -(bbox_bottom * other.escala);
}
