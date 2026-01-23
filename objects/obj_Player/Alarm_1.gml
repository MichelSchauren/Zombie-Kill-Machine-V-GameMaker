// MORREU
if (global.Multiplayer) {
	// Reviver
	estado = PL_ESTADOS.PARADO;
	vida = PLAYER_VIDA_TOTAL;
	x = int64(random_range(global.Spaw_mapa_pos[| 1], global.Spaw_mapa_pos[| 3]));
	y = int64(random_range(global.Spaw_mapa_pos[| 0], global.Spaw_mapa_pos[| 2]));
	image_speed = 1;
} else {
	// Ir para a tela de gameover
	room_goto(GameOver);
}
