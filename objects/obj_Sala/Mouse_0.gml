global.conect_server_ip = ip; // Definir o IP de conexão como sendo o desse servidor
global.server_pvp = pvp;
// Criar cliente e conectar ele ao servidor com o IP de conexão
instance_create_layer(0, 0, "Instances", obj_Client_tcp);