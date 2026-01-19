// Ondas
if (global.Mostrar_ondas) {
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
		draw_set_font(font_Consolas_20);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_text(20, 85, "Onda: " + string(global.Onda_atual));
	}
}

// Player
with (obj_Player) {
	// Desenhar VIDA
	var _larg_barra = display_get_gui_width() / 2;
	var _larg_vida = _larg_barra*(vida / PLAYER_VIDA_TOTAL);
	// fundo da vida
	draw_set_colour(c_red);
	draw_rectangle(20, 20, _larg_barra+20, 68, false);
	// vida
	draw_set_colour(c_green);
	draw_rectangle(20, 20, _larg_vida+20, 68, false);

	// Desenhar NOME
	draw_set_color(c_black);
	draw_set_font(font_Consolas_12);
	draw_set_halign(fa_center);
	draw_set_lighting(fa_middle);
	draw_text(x - camera_get_view_x(view_camera[0]), y-50 - camera_get_view_y(view_camera[0]), global.Player_name);
}

// Mobile
if (global.Controller_mode == 2) {
	if (global.second_control_mode == 0) {
		with (obj_Controles) {
			// Desenhar botões do mobile
			draw_sprite_ext(spr_Seta_mobile, mov_up, x_mobile_mover, y_mobile_mover -50, 1, 1, 90, -1, 255); // up
			draw_sprite_ext(spr_Seta_mobile, mov_left, x_mobile_mover -100, y_mobile_mover +50, 1, 1, 180, -1, 255); // left
			draw_sprite_ext(spr_Seta_mobile, mov_down, x_mobile_mover, y_mobile_mover +50, 1, 1, 270, -1, 255); // down
			draw_sprite_ext(spr_Seta_mobile, mov_rigth, x_mobile_mover +100, y_mobile_mover +50, 1, 1, 0, -1, 255); // right
		}
	} else if (global.second_control_mode == 1) {
		// Desenhar joystick da movimentação
		with (obj_Joystick_mover) {
			// Desenha a base (aro)
			draw_set_alpha(0.3);
			draw_circle_color(anchor_x, anchor_y, radius, #00EE00, #009900, false);
			draw_set_alpha(1.0);

			// Desenha a bolinha (stick)
			draw_sprite_ext(spr_Joystick_mover, active, stick_x, stick_y, 1, 1, 0, c_white, 0.7);
		}
	}
	// Desenhar joystick para atirar
	with (obj_Joystick_atirar) {
		// Desenha a base (aro)
		draw_set_alpha(0.3);
		draw_circle_color(anchor_x, anchor_y, radius, #00EE00, #009900, false);
		draw_set_alpha(1.0);

		// Desenha a bolinha (stick)
		draw_sprite_ext(spr_Joystick_mira, active, stick_x, stick_y, 1, 1, 0, c_white, 0.7);
	} 
}

// Moedas
var _moedas_x = camera_get_view_width(view_camera[0]) -20;
var _moedas_y = 20;
// Fundo
draw_set_colour(c_dkgray);
draw_roundrect_ext(_moedas_x -160, _moedas_y, _moedas_x, _moedas_y +40, 20, 20, false);
// Contorno
draw_set_colour(c_white);
draw_roundrect_ext(_moedas_x -160, _moedas_y, _moedas_x, _moedas_y +40, 20, 20, true);
// Texto
draw_set_colour(c_white);
draw_set_font(font_Consolas_12);
draw_set_halign(fa_left);
draw_set_lighting(fa_center);
draw_text(_moedas_x -150, _moedas_y + 20, string(global.Moedas));
// sprite
draw_sprite(spr_Moeda, 7, _moedas_x -30, _moedas_y +20);


// Monstrar FPS
if (global.Modo_desenvolvedor) { // No futuro criar opção para mostrar o FPS
	// Mostrar fps
	draw_set_colour(c_white);
	draw_set_font(font_Consolas_12);
	draw_set_halign(fa_right);

	var _fps_x = camera_get_view_width(view_camera[0]) -20;
	var _fps_y = 80;
	draw_text(_fps_x, _fps_y, $"FPS: {int64(fps)}");
}

// Mostrar PING
if (global.Multiplayer and instance_exists(obj_Client_tcp)) {
	with (obj_Client_tcp) {
		// Mostrar ping
		draw_set_colour(c_white);
		draw_set_font(font_Consolas_12);
		draw_set_halign(fa_right);

		var _ping_x = camera_get_view_width(view_camera[0]) -20;
		var _ping_y = 100;
		draw_text(_ping_x, _ping_y, $"Ping: {ping}");
	}
}

// Chat
if (global.Mostrar_chat) {
	draw_set_colour(c_dkgray);
	draw_set_alpha(.7);
	draw_roundrect_ext(chat_x, chat_y, chat_x +260, chat_y +300, 10, 10, false);

	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_roundrect_ext(chat_x, chat_y, chat_x +260, chat_y +300, 10, 10, true);

	for (var i = 0; i < ds_list_size(global.Chat_mensagens); i++) {
		var _msg = global.Chat_mensagens[| i];
		draw_set_font(font_Consolas_8);
		draw_set_halign(fa_left);
	
		draw_set_colour(c_aqua);
		draw_text(chat_x+20, chat_y+30 + i*30, _msg[0] + ": ");
	
		draw_set_colour(c_white);
		draw_text(chat_x+20 + string_width($"{_msg[0]}: "), chat_y+30 + i*30, _msg[1]);
	}
}

// Resetar tudo
draw_set_colour(-1);
draw_set_font(-1);
draw_set_halign(-1);