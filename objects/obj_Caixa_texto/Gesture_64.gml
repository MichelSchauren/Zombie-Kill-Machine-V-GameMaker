var clicou_dentro = point_in_rectangle(mouse_x, mouse_y, x, y, x + 100, y + 25);

if (clicou_dentro) 
{
    if (!selecionado) 
	{
        keyboard_virtual_show(kbv_type_default, kbv_autocapitalize_words, kbv_returnkey_default, false);
        keyboard_string = texto;
        selecionado = true;
        io_clear(); 
    }
} 
else 
{
    if (selecionado) 
	{
        selecionado = false;
        
        keyboard_virtual_hide();
        keyboard_string = "";
    }
}