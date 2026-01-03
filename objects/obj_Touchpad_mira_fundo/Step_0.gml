// Acompanhar viewport
x = camera_get_view_x(viewport) +760;
y = camera_get_view_y(viewport) +490;

// destruir instancia caso trocar o modo de controle
if (global.Controller_mode != 2 or obj_Controles.mobile_direction_mode != 1) {
	instance_destroy();
}