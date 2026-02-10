altura = 130;
alcance = 500;
y_real = y;
y -= altura;
depth = obj_DepthSorting.entidades_depth - y_real -1;

enum ARQ_ESTADOS {
	VIGIANDO,
	ATIRANDO
}
estado = ARQ_ESTADOS.VIGIANDO;