// Mostrando interface
if (show) {
	for (var i=0; i < array_length(janela); i++) {
		with (janela[i]) {
			if (fclick > -1) fclick--;
			
			if (fclick == 0) {
				image = 0; // volta ao normal
				fclick = -1;
				if (funcao) funcao();
			}
		}
	}
}