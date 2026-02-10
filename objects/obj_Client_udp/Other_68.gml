if (async_load[? "type"] == network_type_data) {
	var _ip = async_load[? "ip"];
	var _buffer = async_load[? "buffer"]; // buffer/dados enviado pelo cliente
	
	var _cod = buffer_read(_buffer, buffer_u8) // 0x02
    var _nome_server = buffer_read(_buffer, buffer_string); // Nome do servidor
    var _jogadores = buffer_read(_buffer, buffer_string); // Quant. de jogadores
	var _pvp = buffer_read(_buffer, buffer_u8); // PVP ativo?
	var _versao =  buffer_read(_buffer, buffer_string); // Versão do servidor
	
	// Mostrar sala no Menu_Local
	var _salas = instance_find(obj_Salas, 0);
	var _x = _salas.x + 12;
	var _y = _salas.y + 12 + instance_number(obj_Sala)*50;
	
	var _sala = noone;
	if (ds_list_find_index(_salas.ips, _ip) == -1) {
		_sala = instance_create_layer(_x, _y, "Instances", obj_Sala);
		
		_sala.numero = instance_number(_salas); // real
		_sala.nome = _nome_server; // string
		_sala.jogadores = _jogadores; // string
		_sala.ip = _ip; // string
		_sala.pvp = _pvp; // bool
		if (_versao != "") _sala.versao = _versao; // string
	
		ds_list_add(_salas.ips, _ip);
	}		
}