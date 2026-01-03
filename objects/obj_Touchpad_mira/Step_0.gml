image_index = movendo;
var _dist = 0;
if (movendo) _dist = 60;
// Acompanhar viewport
x = camera_get_view_x(viewport) + 760 + lengthdir_x(_dist, direction);
y = camera_get_view_y(viewport) + 490 + lengthdir_y(_dist, direction);

// destruir instancia caso trocar o modo de controle
if (global.Controller_mode != 2) {
	instance_destroy();
}
