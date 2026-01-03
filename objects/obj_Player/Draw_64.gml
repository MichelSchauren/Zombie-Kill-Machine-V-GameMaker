// Desenhar VIDA
var larg_vida = 640*(vida / global.Player_VIDA_TOTAL);

// fundo
draw_set_colour(c_red);
draw_rectangle(20, 20, 660, 68, false);
// vida
draw_set_colour(c_green);
draw_rectangle(20, 20, larg_vida+20, 68, false);
