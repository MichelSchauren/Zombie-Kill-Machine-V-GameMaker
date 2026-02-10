// Mostrando interface
if (show) {
	for (var i=0; i < array_length(vendas); i++) {
		with (vendas[i]) {
			if (fclick > -1) fclick--;
			
			if (fclick == 0) {
				image = 0; // volta ao normal
			}
		}
	}
}