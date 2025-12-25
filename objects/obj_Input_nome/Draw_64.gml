var _texto;
if (global.Player_name == "" and !selecionado) _texto = folder;
else _texto = global.Player_name;

// Texto
draw_set_color(c_black);
draw_set_font(font_Consolas);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(x + 20, y, _texto);

// Cursor piscando se ativo
if (selecionado and (current_time mod 1000) < 500) {
    draw_text(x + 20 + string_width(_texto), y, "|");
}
