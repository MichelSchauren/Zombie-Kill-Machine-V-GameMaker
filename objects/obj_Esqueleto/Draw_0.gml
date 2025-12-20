var larg_vida = 80*(vida / global.Esqueleto_VIDA_TOTAL);

// desenhar a sprite
draw_self()
// fundo
draw_set_colour(c_red);
draw_rectangle(x-40, y-60, x+40, y-50, false);
// vida
draw_set_colour(c_green);
draw_rectangle(x-40, y-60, x-40 + larg_vida, y-50, false);