draw_self();

// Desenhar NOME
draw_set_color(c_black);
draw_set_font(font_Consolas_12);
draw_set_halign(fa_center);
draw_set_lighting(fa_middle);

draw_text(x, y-50, global.Player_name);

// desenhar colisão
if (global.Mostrar_colisoes_player) {
	draw_sprite(spr_colisao, 0, x, y);
}
