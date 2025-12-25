if (room == Multiplayer) {
	// Reviver
	morto = false;
	vida = global.Player_VIDA_TOTAL;
	x = 1536;
	y = 1536;
	image_speed = 1;
} else {
	// Ir para a tela de gameover
	room_goto(GameOver);
}
