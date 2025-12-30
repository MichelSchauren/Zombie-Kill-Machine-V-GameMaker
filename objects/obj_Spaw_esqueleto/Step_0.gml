if (global.Spaw_inimigos and pode_spawnar and instance_number(obj_Inimigos) < global.Inimigos_spaw_limit) {
	var esqueleto = instance_create_layer(x, y, "Personagens", obj_Esqueleto);
	pode_spawnar = false;
	alarm[0] = cooldown;
}