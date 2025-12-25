global.input_server_nome = instance_find(obj_Caixa_texto, 0);
global.input_server_nome.folder = $"Sala{int64(random_range(100, 999))}";

global.input_server_jogadores = instance_find(obj_Caixa_texto, 1);
global.input_server_jogadores.folder = "10";