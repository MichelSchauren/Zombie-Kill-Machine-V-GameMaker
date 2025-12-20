if (instance_number(obj_Inimigos) < 10 and pode_spawnar) {
	var esqueleto = instance_create_layer(x, y, "Personagens", obj_Esqueleto);
	pode_spawnar = false;
	alarm[0] = cooldown;
}