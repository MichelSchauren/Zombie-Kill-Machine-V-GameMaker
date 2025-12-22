draw_self();

// Desenhar NOME
draw_set_color(c_black);
draw_set_font(font_Gabriola);
draw_set_halign(fa_center);
draw_set_lighting(fa_center);

draw_text(x, y-80, global.Player_name);
