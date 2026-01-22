// Se clicar com o mouse para começar a digitar
if point_in_rectangle(mouse_x, mouse_y, x, y, x+100, y+25) {
	selecionado = true;
	keyboard_string = texto; // atualiza o keyboard para ter o nome salvo
} else {
	selecionado = false
	keyboard_string = ""; // limpa o keyboard
}