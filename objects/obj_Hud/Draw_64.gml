with (obj_Ondas) {
	// Surface de claridade/escuridão
	if (surface_exists(surface)) {
		// Desenhar surface
		draw_surface_ext(surface, 0, 0, 4, 4, 0, c_black, alpha);
	} else {
		// Criar surface caso não existir
		surface = surface_create(surf_width, surf_height);
	
		surface_set_target(surface);
		draw_set_colour(c_black);
		draw_rectangle(0, 0, surf_width, surf_height, false);
		surface_reset_target();
	}

	// Desenhar testo da onda
	draw_set_color(c_white);
	draw_set_font(font_Consolas);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_text(20, 85, "Onda: " + string(global.Onda_atual));
}

with (obj_Player) {
	// Desenhar VIDA
	var larg_vida = 640*(vida / global.Player_VIDA_TOTAL);
	// fundo da vida
	draw_set_colour(c_red);
	draw_rectangle(20, 20, 660, 68, false);
	// vida
	draw_set_colour(c_green);
	draw_rectangle(20, 20, larg_vida+20, 68, false);

	// Desenhar NOME
	draw_set_color(c_black);
	draw_set_font(font_Consolas_12);
	draw_set_halign(fa_center);
	draw_set_lighting(fa_middle);
	draw_text(x - camera_get_view_x(view_camera[0]), y-50 - camera_get_view_y(view_camera[0]), global.Player_name);
}

with (obj_Controles) {
	// Desenhar botões do mobile
	if (global.Controller_mode == 2 and global.second_control_mode == 0) {
		draw_sprite_ext(spr_Seta_mobile, mov_up, x_mobile_mover, y_mobile_mover -50, 1, 1, 90, -1, 255); // up
		draw_sprite_ext(spr_Seta_mobile, mov_left, x_mobile_mover -100, y_mobile_mover +50, 1, 1, 180, -1, 255); // left
		draw_sprite_ext(spr_Seta_mobile, mov_down, x_mobile_mover, y_mobile_mover +50, 1, 1, 270, -1, 255); // down
		draw_sprite_ext(spr_Seta_mobile, mov_rigth, x_mobile_mover +100, y_mobile_mover +50, 1, 1, 0, -1, 255); // right
	}
}


// Monstrar FPS
if (global.Modo_desenvolvedor) { // No futuro criar opção para mostrar o FPS
	// Mostrar fps
	draw_set_colour(c_white);
	draw_set_font(font_Consolas_12);
	draw_set_halign(fa_right);

	draw_text(camera_get_view_width(view_camera[0]) -20, 20, $"FPS: {int64(fps)}");
}

// Mostrar PING
if (instance_exists(obj_Client_tcp)) {
	with (obj_Client_tcp) {
		// Mostrar ping
		draw_set_colour(c_white);
		draw_set_font(font_Consolas_12);
		draw_set_halign(fa_right);

		draw_text(940, 20, $"Ping: {ping}");
	}
}

// Resetar tudo
draw_set_colour(-1);
draw_set_font(-1);
draw_set_halign(-1);