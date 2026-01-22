global.input_server_nome = instance_create_layer(416, 96, "Instances", obj_Caixa_texto);
global.input_server_nome.folder = $"Sala{int64(random_range(100, 999))}";

global.input_server_jogadores = instance_create_layer(448, 128, "Instances", obj_Caixa_texto);
global.input_server_jogadores.folder = "10";
global.input_server_jogadores.max_caracteres = 2;
