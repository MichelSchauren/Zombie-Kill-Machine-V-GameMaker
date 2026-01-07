// Configurações do Joystick
anchor_x = min (window_get_width(), 1580)*0.2; // Posição fixa na tela (GUI)
anchor_y = min (window_get_height(), 720)*0.8;
radius = 60;   // Raio da base
stick_x = anchor_x;
stick_y = anchor_y;

touch_id = -1; // Armazena qual dedo está controlando este joystick (-1 = nenhum)
active = false;

// Saída para o player usar
input_dir = 0;