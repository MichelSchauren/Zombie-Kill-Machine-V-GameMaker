// Desenhar VIDA
var larg_vida = 640*(vida / global.Player_VIDA_TOTAL);

// fundo
draw_set_colour(c_red);
draw_rectangle(20, 20, 660, 68, false);
// vida
draw_set_colour(c_green);
draw_rectangle(20, 20, larg_vida+20, 68, false);

// Onda
draw_set_color(c_white);
draw_set_font(font_Consolas);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(20, 85, "Onda: " + string(global.onda));