if (alpha < 0.75)
{ // Está escurecendo
	alpha = min (alpha + passo_alpha, max_alpha);
	alarm[0] = frames_alpha; // 20 frames
}
else
{ // Agora é noite
	alarm[1] = global.Tempo_noite;
	
	spawnar_orda();
	alarm[2] = global.Tempo_orda_noite;
}