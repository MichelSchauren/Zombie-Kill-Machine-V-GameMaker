var _mesma_versao = false;
var _my_version = GM_version;
if (global.Controller_mode == 2 or string_length(versao) == 5) {
	_my_version = string_copy(_my_version, 0, 5);
	versao = string_copy(versao, 0, 5);
	_mesma_versao = (_my_version == versao);
} else {
	_mesma_versao = (_my_version == versao);
}

if (_mesma_versao) {
	global.conect_server_ip = ip; // Definir o IP de conexão como sendo o desse servidor
	global.server_pvp = pvp;

	global.Multiplayer = true;
	global.Multiplayer_adm = false; // entrando em outro server
	room_goto(global.Mapa_atual);
} else {
	msg = show_question_async($"Sua versão é diferente da versão do servidor. \nCliente: {GM_version} \nServidor: {versao}\n\n"
	+ "Atualize o jogo para versão correta ou peça ao admin para mudar a versão do servidor.\n"
	+ "Quer atualizar o jogo?");
}