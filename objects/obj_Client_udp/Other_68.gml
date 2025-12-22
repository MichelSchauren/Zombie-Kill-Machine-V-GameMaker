if (async_load[? "type"] == network_type_data) {
	var _ip = async_load[? "ip"];
	var _buffer = async_load[? "buffer"]; // buffer/dados enviado pelo cliente
	
    var _cod = buffer_read(_buffer, buffer_u8); // Código de Resposta
    var _nome_server = buffer_read(_buffer, buffer_string); // Nome do servidor
    var _porta_tcp = buffer_read(_buffer, buffer_u16); // Porta TCP
    var _jogadores = buffer_read(_buffer, buffer_string); // Quant. de jogadores
	
	// Mostrar sala no Menu_Local
	var _salas = instance_find(obj_Salas, 0);
	var _x = _salas.x + 10;
	var _y = _salas.y + 10 + instance_number(obj_Entrada_sala)*28;
	
	var _entrada_sala = noone;
	if (! array_contains(_salas.ips, _ip)) {
		_entrada_sala = instance_create_layer(_x, _y, "Instances", obj_Entrada_sala);
		
		_entrada_sala.numero = $"0{instance_number(_salas)}";
		_entrada_sala.nome = _nome_server;
		_entrada_sala.jogadores = _jogadores;
		_entrada_sala.ip = _ip;
		_entrada_sala.porta = _porta_tcp;
	
		array_insert(_salas.ips, -1, _ip);
	}		
} 