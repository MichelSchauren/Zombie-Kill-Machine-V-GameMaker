// DELIMITAR UM TAMANHO DA JANELA DO JOGO
window_set_min_width(640);
window_set_min_height(360);
window_set_size(960, 540);
window_center();


// DEFINIR MODO DE CONTROLE
if (os_type == os_windows) { // por padrão já é 0
	global.Controller_mode = 0;
	
} else if (os_type == os_android or os_type == os_ios) {
	global.Controller_mode = 2;
}


// Criar lista de gamepads
var _gamepad_list = ds_list_create();
for (var i=0; i < gamepad_get_device_count(); i++) {
	if (gamepad_is_connected(i)) ds_list_add(_gamepad_list, i);
}

if (ds_list_size(_gamepad_list) > 1) { // gamepad 0 está sempre conectado
	global.Controller_mode = 1;
}