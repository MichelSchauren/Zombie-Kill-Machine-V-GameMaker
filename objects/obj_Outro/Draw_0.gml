draw_self();

// Desenhar NOME
draw_set_color(c_black);
draw_set_font(font_Consolas_12);
draw_set_halign(fa_center);
draw_set_lighting(fa_middle);
draw_text(x, y-65, nome);


// Desenhar VIDA
var larg_vida = 80*(vida / global.Player_VIDA_TOTAL);
// fundo
draw_set_colour(c_red);
draw_rectangle(x-40, y-44, x+40, y-34, false);
// vida
draw_set_colour(c_green);
draw_rectangle(x-40, y-44, x-40 + larg_vida, y-34, false);
