// Desenha a base (aro)
draw_set_alpha(0.3);
draw_circle_color(anchor_x, anchor_y, radius, #00EE00, #009900, false);
draw_set_alpha(1.0);

// Desenha a bolinha (stick)
draw_sprite_ext(spr_Joystick_mover, active, stick_x, stick_y, 1, 1, 0, c_white, 0.7);
