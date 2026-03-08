// Mostrando interface
if (show) {
	for (var i=0; i < array_length(torres); i++) {
		with (torres[i]) {
			if (fclick > -1) fclick--;
			
			if (fclick == 0) {
				if (image == 1) {
					other.show = false;
					obj_Player.estado = PL_ESTADOS.PARADO;
					
					// construir torre
					if (global.Multiplayer) { // multiplayer
						var _buffer = obj_Client_tcp.client_buffer;
						buffer_seek(_buffer, buffer_seek_start, 0); // Ir para início do buffer
						buffer_write(_buffer, buffer_u8, Events_client_server.construi_torre);
						buffer_write(_buffer, buffer_u8, i); // Indice da torre dentro do vetor
						buffer_write(_buffer, buffer_u8, other.indice); // Indice do espaço da torre
						network_send_packet(obj_Client_tcp.socket_tcp, _buffer, buffer_tell(_buffer));
						
					} else { // normal
						other.construir_torre(i);
					}
				}
				
				image = 0; // volta ao normal
			}
		}
	}
}