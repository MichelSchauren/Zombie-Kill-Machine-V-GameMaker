function f_Resetar_controles() {
	if (global.Controller_mode == 2) {
		instance_destroy(obj_Joystick_mover);
		instance_destroy(obj_Joystick_atirar);
	}
	
	instance_destroy(obj_Controles);
	instance_create_layer(0, 0, "Abstratos", obj_Controles);
}