if (alpha > 0)
{ // Está clareando
	alpha = max(alpha - passo_alpha, min_alpha);
	alarm[1] = frames_alpha; // 20 frames
}
else
{ // Agora é dia
	alarm[0] = global.Tempo_dia;
	global.Onda_atual += 1; // Novo dia nova onda
	global.Peso_orda += 2; // temporário
	
	spawnar_orda();
	alarm[2] = global.Tempo_orda_noite;
}