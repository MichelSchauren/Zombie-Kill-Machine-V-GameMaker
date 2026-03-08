if (!global.Tempo_pausado) {
	if (alpha > 0)
	{ // Está clareando
		alpha = max(alpha - passo_alpha, min_alpha);
		alarm[1] = frames_alpha; // 20 frames
	}
	else
	{ // Agora é dia
		alarm[0] = TEMPO_DIA;
		global.Onda_atual += 1; // Novo dia nova onda
		global.Peso_orda += 2; // temporário
		obj_Player.vida = PLAYER_VIDA_TOTAL; // player com vida cheia
		with (obj_Torre_arqueira) { // torres com vida cheia
			if (global.Multiplayer_adm) obj_Server.atualizar_vida_torre(indice, vars.vida);
			else vida = vars.vida;
		}
	
		spawnar_orda();
		alarm[2] = TEMPO_ORDA_DIA;
	}
}