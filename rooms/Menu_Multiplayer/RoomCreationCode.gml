global.input_server_nome = instance_create_layer(416, 96, "Instances", obj_Caixa_texto);
global.input_server_nome.folder = $"Sala{int64(random_range(100, 999))}";

global.input_server_jogadores = instance_create_layer(448, 128, "Instances", obj_Caixa_texto);
global.input_server_jogadores.folder = "10";
global.input_server_jogadores.max_caracteres = 2;

show_message_async(
@"Nesta versão o Modo Multiplayer pode conter bugs ou não funcionar corretamente.
Nossa equipe está trabalhando constantemente para resolver todos os problemas,
sempre com o objetivo de proporcionar uma melhor experiência ao público. 
Pedimos desculpas por qualquer transtorno.");
