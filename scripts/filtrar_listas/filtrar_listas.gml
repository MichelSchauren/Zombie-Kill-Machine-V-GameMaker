function f_filtrar_list_i(list, indices) {
	var _new_list = ds_list_create();
	ds_list_copy(_new_list, list);
	
	for (var i=0; i < array_length(indices); i++) {
		ds_list_delete(_new_list, indices[i]);
	}
	
	return _new_list;
}

function f_filtrar_list_v(list, value) {
	var _new_list = ds_list_create();
	ds_list_copy(_new_list, list);
	
	var _index = ds_list_find_index(_new_list, value);
	ds_list_delete(_new_list, _index);
	
	return _new_list;
}