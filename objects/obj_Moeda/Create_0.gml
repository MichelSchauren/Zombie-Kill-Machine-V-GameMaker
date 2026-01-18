depth = layer_get_depth("Estruturas") - y;
vel_x = random_range(-1, 1);
meta_y = y -20;
vel_y = -4;
gravidade = .15;
y -= 40;

// Alarme para destruir moeda
alarm[0] = game_get_speed(gamespeed_fps) * 30; // 30 seg