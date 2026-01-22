// Desenhar fundo
var _spr_fundo = spr_Fundo_gameover;
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _scale_x = _gui_w / sprite_get_width(_spr_fundo);
var _scale_y = _gui_h / sprite_get_height(_spr_fundo);
var _scale = max(_scale_x, _scale_y);

draw_sprite_ext(_spr_fundo, 0, _gui_w / 2, _gui_h / 2, _scale, _scale, 0, c_white, 1);

// Desenhar botão menu
with (b_menu) {
	if (sprite != noone) draw_sprite_ext(sprite, image, gui_x, gui_y, scale, scale, 0, -1, 1);
}
