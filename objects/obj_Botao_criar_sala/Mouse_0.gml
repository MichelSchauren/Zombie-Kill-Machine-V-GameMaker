var _nome = global.input_server_nome.folder;
var _jogadores = global.input_server_jogadores.folder;

try {
	if (global.input_server_nome.texto != "") _nome = global.input_server_nome.texto;
	if (global.input_server_jogadores.texto != "") _jogadores = real(global.input_server_jogadores.texto);
	if (_jogadores <= 0) _jogadores = 1;

	global.server_nome = _nome;
	global.server_jogadores = _jogadores;
	
} catch (_exception) {
	var _index = string_length(_exception.stacktrace[0]) -1;
	var _line_error = string_copy(_exception.stacktrace[0], _index, 1); // Pegar linha em que ocorreu o erro!
	var _error = string(_exception.message);
	
	if (_line_error == "6") {
		_error = "O campo 'Jogadores' precisa ser um número";
	}
	
	show_message("Não foi possível criar o servidor!\n" +
	            "Verifique se os dados foram preenchidos corretamente e tente novamente!\n\n" + 
	            "Erro: " + _error + "\n")

	return;
}

global.Multiplayer = true;
room_goto(global.Mapa_atual);