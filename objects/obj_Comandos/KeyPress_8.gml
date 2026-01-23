// No mobile funciona ao clicar na setinha de voltar
if (global.Controller_mode == 2 and !keyboard_virtual_status()) {
	room_goto(Menu);
}
