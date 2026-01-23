if (!global.Tempo_pausado) {
	if (alpha == min_alpha) { // É dia
		alarm[2] = TEMPO_ORDA_DIA;
		spawnar_orda();
	
	} else if (alpha == max_alpha) {
		alarm[2] = TEMPO_ORDA_NOITE;
		spawnar_orda();
	}
}