// Percorre os primeiros 5 dedos possíveis na tela
for (var i = 0; i < 5; i++) {
	// Se o dedo acabou de tocar a tela e está perto do centro do joystick
    if (device_mouse_check_button_pressed(i, mb_left)) {
		var gui_x = device_mouse_x_to_gui(i);
		var gui_y = device_mouse_y_to_gui(i);
		
        if (point_distance(gui_x, gui_y, anchor_x, anchor_y) < radius) {
            touch_id = i;
            active = true;
        }
    }
}

// Se o joystick está sendo controlado por um dedo
if (active) {
    if (device_mouse_check_button(touch_id, mb_left)) {
		var gui_x = device_mouse_x_to_gui(touch_id);
		var gui_y = device_mouse_y_to_gui(touch_id);
	
        // Calcula o ângulo
        var dir = point_direction(anchor_x, anchor_y, gui_x, gui_y);
        
        // Limita a bolinha dentro do raio do joystick
        stick_x = anchor_x + lengthdir_x(radius, dir);
        stick_y = anchor_y + lengthdir_y(radius, dir);
        
        // Define as saídas para o seu personagem ler
        input_dir = dir;
    } else {
        // Soltou o dedo
        active = false;
        touch_id = -1;
        stick_x = anchor_x;
        stick_y = anchor_y;
    }
}

// Destruir joystick caso não estiver mais no modo mobile
if (global.Controller_mode != 2 or global.second_control_mode != 1) {
	instance_destroy();
}