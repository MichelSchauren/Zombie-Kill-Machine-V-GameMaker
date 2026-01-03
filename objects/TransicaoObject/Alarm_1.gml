if (image_alpha > 0)
{
	image_alpha -= 0.0375;
	alarm[1] = game_get_speed(gamespeed_fps);
}
else
{
	global.onda += 1;
	alarm[0] = game_get_speed(gamespeed_fps) * 50;
}