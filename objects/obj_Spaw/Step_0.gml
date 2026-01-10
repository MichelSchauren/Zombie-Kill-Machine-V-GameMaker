if (pode_spawnar and ds_list_size(global.Orda) > 0) {
	var _inimigo = ds_list_find_value(global.Orda, 0); // 1º inimigo da lista
	ds_list_delete(global.Orda, 0); // Deletar inimigo da lista
	instance_create_layer(x, y, "Personagens", _inimigo); // Spawnar inimigo
	
	pode_spawnar = false;
	alarm[0] = cooldown;
}