// Mostrando interface
if (show) {
	for (var i=0; i < array_length(torres); i++) {
		with (torres[i]) {
			if (fclick > -1) fclick--;
			
			if (fclick == 0) {
				if (image == 1) {
					other.show = false;
					obj_Player.estado = PL_ESTADOS.PARADO;
					
					instance_destroy(other);
					instance_create_layer(other.x, other.y, "Estruturas", obj_Torre_arqueira);
				}
				
				image = 0; // volta ao normal
			}
		}
	}
}