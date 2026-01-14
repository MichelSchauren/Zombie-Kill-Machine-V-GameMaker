instance_destroy(); // Destruir instancia
network_destroy(socket_tcp); // desconectar e destruir o socket TCP
buffer_delete(client_buffer); // excluir buffer
global.conect_server_ip = noone; // resetar IP do servidor
ds_list_clear(global.Chat_mensagens); // Limpar mensagens do chat