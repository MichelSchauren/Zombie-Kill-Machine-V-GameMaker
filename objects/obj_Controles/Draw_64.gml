// Desenhar botões do mobile
if (global.Controller_mode == 2 and global.second_control_mode == 0) {
	draw_sprite_ext(spr_Seta_mobile, mov_up, 160, 480, 1, 1, 90, -1, 255);
	draw_sprite_ext(spr_Seta_mobile, mov_left, 60, 580, 1, 1, 180, -1, 255);
	draw_sprite_ext(spr_Seta_mobile, mov_down, 160, 580, 1, 1, 270, -1, 255);
	draw_sprite_ext(spr_Seta_mobile, mov_rigth, 260, 580, 1, 1, 0, -1, 255);
}
