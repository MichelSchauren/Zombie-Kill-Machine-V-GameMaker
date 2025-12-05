var _up, _left, _down, _right;

// Inputs
_up = keyboard_check(inputs.up);
_left = keyboard_check(inputs.left)
_down = keyboard_check(inputs.down)
_right = keyboard_check(inputs.right)
mouse_press = mouse_check_button(1)

// Mover o Player
movx = (_right - _left) * vel;
movy = (_down - _up) * vel;
// Velocidade correta na diagonal
if (movx != 0 and movy != 0) movx *= .7; movy *= .7;

// Definir sprite
// Se movendo
if (movx != 0 or movy != 0) {
	if (mouse_press) {// atirando enquanto se move
		sprite_index = spr_Player_atirandomov
		image_xscale = sign(mouse_x - x)
		vel = VEL_ATIRANDO
	} else { // correndo
		sprite_index = spr_Player_correndo;
		if (movx != 0) image_xscale = sign(movx);
		vel = VEL_CORRENDO
	}
// Parado
} else {
	if (mouse_press) {// atirando enquanto se move
		sprite_index = spr_Player_atirando
		image_xscale = sign(mouse_x - x)
	} else {// parado
		sprite_index = spr_Player_parado;
	}
}