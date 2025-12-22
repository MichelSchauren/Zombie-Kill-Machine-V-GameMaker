function f_Escrever_chat(nome, msg){
	array_insert(obj_Chat.mensagens, -1, [nome, msg]);
	if (array_length(obj_Chat.mensagens) > 10) {
		array_delete(obj_Chat.mensagens, 0, 1);
	}
}