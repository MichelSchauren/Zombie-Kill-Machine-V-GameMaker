var _nome = global.input_server_nome.folder;
var _jogadores = global.input_server_jogadores.folder;

try {
	if (global.input_server_nome.texto != "") _nome = global.input_server_nome.texto;
	if (global.input_server_jogadores.texto != "") _jogadores = real(global.input_server_jogadores.texto);

	global.server_nome = _nome;
	global.server_jogadores = _jogadores;
	
} catch (_exception) {
	show_message(@"Não foi possivel criar o servidor!
	\nVerifique se os dados foram preenchidas corretamente e tente novamente!\n
	" + _exception.message + _exception.longMessage + _exception.script + _exception.stacktrace);
}

var _server = instance_create_layer(0, 0, "Instances", obj_Server); // Criar servidor

global.conect_server_ip = "127.0.0.1"; // Definir o IP como local
// Criar cliente e conectar ele ao servidor com o IP local
instance_create_layer(0, 0, "Instances", obj_Client_tcp);
