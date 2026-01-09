// Surface
surf = noone;
momento = 0;

dia_noite = function()
{
	
	momento = sin(( .01 * get_timer() / 1000000) + 1) / 2;
	
	if (surface_exists(surf))
	{
		surface_set_target(surf);
		
		draw_set_colour(c_black);
		draw_set_alpha(min(momento, 0.9));
		draw_rectangle(0, 0, room_width, room_height, false);
		
		draw_set_alpha(1);
		draw_set_colour(-1);
		surface_reset_target();
		
		draw_surface(surf, 0, 0);
	}
	else
	{
		surf = surface_create(room_width, room_height);
	}
}