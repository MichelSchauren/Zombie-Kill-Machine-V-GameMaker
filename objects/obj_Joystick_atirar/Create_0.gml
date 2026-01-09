// Configurações do Joystick
anchor_x = obj_Controles.x_mobile_atirar; // Posição fixa na tela (GUI)
anchor_y = obj_Controles.y_mobile_atirar;
radius = 60;   // Raio da base
stick_x = anchor_x;
stick_y = anchor_y;

touch_id = -1; // Armazena qual dedo está controlando este joystick (-1 = nenhum)
active = false;

// Saída para o player usar
input_dir = 0;