level = 0;
vida_total = struct_get(TORRE_ARQUEIRA[level], "vida");
vida = vida_total;

// Calcula a profundidade com base altura em relação a room
depth = obj_DepthSorting.entidades_depth - y;
solid = true;

image_speed = 0;

// Criar arqueiro
arqueiro = instance_create_layer(x, y, "Personagens", obj_Arqueiro);

evoluir_level = function (l) {
	level = l;
	vida_total = struct_get(TORRE_ARQUEIRA[l], "vida");
	vida = vida_total;
	image_index = l;
	arqueiro.evoluir_level(l);
}