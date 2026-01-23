if (global.Multiplayer) {
	modo_desenvolvedor = global.Modo_desenvolvedor;
	spaw_inimigos = global.Spaw_inimigos;
	tempo_pausado = global.Tempo_pausado;
	
	global.Mostrar_chat = true;
	if (global.Multiplayer_adm) {
		global.conect_server_ip = "127.0.0.1"; // Definir o IP como local
		// Criar servidor
		instance_create_layer(0, 0, "Abstratos", obj_Server);
	} else {
		global.Modo_desenvolvedor = false;
		global.Spaw_inimigos = false;
		global.Tempo_pausado = true;
	}
	
	// Criar cliente e conectar ele ao servidor com o IP local
	instance_create_layer(0, 0, "Abstratos", obj_Client_tcp);
}
