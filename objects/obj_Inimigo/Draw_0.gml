// desenhar a sprite
draw_self()

var _larg_vida = 80*(vida / vida_total);

// fundo da vida
draw_set_colour(c_red);
draw_rectangle(x-40, y-60, x+40, y-50, false);
// vida
draw_set_colour(c_green);
draw_rectangle(x-40, y-60, x-40 + _larg_vida, y-50, false);

// desenhar colisoes
if (global.Mostrar_colisoes_inimigos) {
	draw_sprite(spr_colisao, 0, x, y);
}