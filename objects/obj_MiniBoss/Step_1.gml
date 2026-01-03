// Calcular a distância até o jogador (obj_Player)
var _dist_player = point_distance(x, y, obj_Player.x, obj_Player.y);

// Se estiver com o alcance suficiente
if (alcance_corpo +140 < _dist_player and _dist_player < alcance_atirando and !pode_atirar) {
	pode_atirar = true;
	alarm[1] = game_get_speed(gamespeed_fps)*4; // time de 4 segundos para poder atirar
}