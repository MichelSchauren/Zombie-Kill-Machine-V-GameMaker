level = 0;
vars = TORRE_ARQUEIRA[level];
y_real = y;
y -= vars.altura;
depth = obj_DepthSorting.entidades_depth - y_real -1;

enum ARQ_ESTADOS {
	VIGIANDO,
	ATIRANDO
}
estado = ARQ_ESTADOS.VIGIANDO;

evoluir_level = function (l) {
	level = l;
	vars = TORRE_ARQUEIRA[level];
	y = y_real - vars.altura;
}