// Texto
draw_set_color(c_black);
draw_set_font(font_InputNome);
draw_text(x + 20, y, texto);

// Cursor piscando se ativo
if (selecionado and (current_time mod 1000) < 500) {
    draw_text(x + 20 + string_width(texto), y, "|");
}
