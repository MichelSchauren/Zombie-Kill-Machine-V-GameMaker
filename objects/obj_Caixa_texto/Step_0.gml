// No Evento Step
// Se clicar com o mouse (ex: no objeto) para começar a digitar
if mouse_check_button_pressed(mb_left) {
	if point_in_rectangle(mouse_x, mouse_y, x, y, x+100, y+25) {
		selecionado = true;
		keyboard_string = texto; // atualiza o keyboard para ter o nome salvo
	} else {
		selecionado = false;
	}
}
