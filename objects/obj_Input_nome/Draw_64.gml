// Texto
draw_set_color(c_black);
draw_set_font(font_Gabriola);
draw_set_halign(fa_top);
draw_set_lighting(fa_left);
draw_text(x + 20, y, global.player_name);

// Cursor piscando se ativo
if (selecionado and (current_time mod 1000) < 500) {
    draw_text(x + 20 + string_width(global.player_name), y, "|");
}
