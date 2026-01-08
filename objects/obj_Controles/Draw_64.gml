// Desenhar botões do mobile
if (global.Controller_mode == 2 and global.second_control_mode == 0) {
	draw_sprite_ext(spr_Seta_mobile, mov_up, x_mobile_mover, y_mobile_mover -50, 1, 1, 90, -1, 255); // up
	draw_sprite_ext(spr_Seta_mobile, mov_left, x_mobile_mover -100, y_mobile_mover +50, 1, 1, 180, -1, 255); // left
	draw_sprite_ext(spr_Seta_mobile, mov_down, x_mobile_mover, y_mobile_mover +50, 1, 1, 270, -1, 255); // down
	draw_sprite_ext(spr_Seta_mobile, mov_rigth, x_mobile_mover +100, y_mobile_mover +50, 1, 1, 0, -1, 255); // right
}
