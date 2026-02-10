draw_self();

draw_set_colour(c_yellow);
draw_set_font(font_Consolas_12);

draw_set_halign(fa_left);
draw_text(x +8, y +10, $"{numero} | {nome}");

draw_set_halign(fa_right);
var pvp_str;
if (pvp) pvp_str = "PVP"; else pvp_str = "";
draw_text(bbox_right -8, y +10, $"{pvp_str} | {versao} | {jogadores}");