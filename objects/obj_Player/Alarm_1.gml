// MORREU
if (global.Multiplayer) {
	// Reviver
	estado = PL_ESTADOS.PARADO;
	vida = PLAYER_VIDA_TOTAL;
	x = int64(random_range(1250, 1800));
	y = int64(random_range(1450, 1540));
	image_speed = 1;
} else {
	// Ir para a tela de gameover
	room_goto(GameOver);
}
