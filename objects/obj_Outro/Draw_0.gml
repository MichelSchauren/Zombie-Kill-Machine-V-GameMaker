draw_self();

// Desenhar NOME
draw_set_color(c_black);
draw_set_font(font_Gabriola);
draw_set_halign(fa_center);
draw_set_lighting(fa_center);
draw_text(x, y-80, nome);


// Desenhar VIDA
var larg_vida = 80*(vida / global.Player_VIDA_TOTAL);
// fundo
draw_set_colour(c_red);
draw_rectangle(x-40, y-60, x+40, y-50, false);
// vida
draw_set_colour(c_green);
draw_rectangle(x-40, y-60, x-40 + larg_vida, y-50, false);
