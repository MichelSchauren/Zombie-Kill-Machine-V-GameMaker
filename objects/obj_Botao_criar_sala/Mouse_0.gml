instance_create_layer(0, 0, "Instances", obj_Server); // Criar servidor
global.conect_server_ip = "127.0.0.1"; // Definir o IP como local
// Criar cliente e conectar ele ao servidor com o IP local
instance_create_layer(0, 0, "Instances", obj_Client_tcp);
