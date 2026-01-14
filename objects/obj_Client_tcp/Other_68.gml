// Async - Networking (Client TCP)
var _socket_id = async_load[? "id"]; // id do socket que disparou o evento
var _type_event = async_load[? "type"]; // tipo de evento do cliente
var _socket = async_load[? "socket"]; // o socket ao qual o _socket_id está conectado (connect/desconnect)
var _buffer = async_load[? "buffer"]; // buffer/dados enviado pelo cliente

switch (_type_event) {
	case network_type_data:
		buffer_seek(_buffer, buffer_seek_start, 0); // ir para o início do buffer
		var msg_id = buffer_read(_buffer, buffer_u8); // ID da mensagem
			
		// Oque será feito com os dados recebidos
		switch (msg_id) {
			case Events_server_client.atualizar_ping:
				var _tempo_envio = buffer_read(_buffer, buffer_u32);
				ping = current_time - _tempo_envio;
				alarm[1] = fps*5;
				break;
				
			case Events_server_client.mudar_inimigo:
				var _enemy_id = buffer_read(_buffer, buffer_string);
				var _enemy = inimigos_struct[$ _enemy_id];
				
				with (_enemy) {
					x = buffer_read(_buffer, buffer_u16);
					y = buffer_read(_buffer, buffer_u16);
					vida = buffer_read(_buffer, buffer_u8);
					sprite_index = buffer_read(_buffer, buffer_u8);
					image_index = buffer_read(_buffer, buffer_u8);
					image_xscale = buffer_read(_buffer, buffer_s8);
				}
				
				break;
		
			case Events_server_client.mudar_outro:
				var _socket_outro = buffer_read(_buffer, buffer_u8);				
				var _outro = outros_struct[$ _socket_outro];
				
				with (_outro) {
					x = buffer_read(_buffer, buffer_u16);
					y = buffer_read(_buffer, buffer_u16);
					vida = buffer_read(_buffer, buffer_u8);
					sprite_index = buffer_read(_buffer, buffer_u8);
					image_index = buffer_read(_buffer, buffer_u8);
					image_xscale = buffer_read(_buffer, buffer_s8);
				}
			
				break;
		
			case Events_server_client.novo_projetil:
				var _proj_obj = buffer_read(_buffer, buffer_u16);
				var _proj_x = buffer_read(_buffer, buffer_u16);
				var _proj_y = buffer_read(_buffer, buffer_u16);
				var _proj_dir = buffer_read(_buffer, buffer_u16);
				
				var _proj_instance = instance_create_layer(_proj_x, _proj_y, "Projeteis", _proj_obj);
				_proj_instance.direction = _proj_dir;
			
				break;
				
			case Events_server_client.novo_inimigo:
				var _new_enemy_id = buffer_read(_buffer, buffer_string);
				var _enemy_x = buffer_read(_buffer, buffer_u16);
				var _enemy_y = buffer_read(_buffer, buffer_u16);
				
				var _new_enemy = instance_create_layer(_enemy_x, _enemy_y, "Personagens", obj_Inimigo_server);
				inimigos_struct[$ _new_enemy_id] = _new_enemy;
				
				with (_new_enemy) {
					inimigo_id = _new_enemy;
					vida_total = buffer_read(_buffer, buffer_u8);
					vida = vida_total;
					spr_colisao = buffer_read(_buffer, buffer_u8);
					spr_morrendo = buffer_read(_buffer, buffer_u8);
					sprite_index = buffer_read(_buffer, buffer_u8);
				}
				
				break;
				
			case Events_server_client.novo_chat:
				var _nome = buffer_read(_buffer, buffer_string);
				var _msg = buffer_read(_buffer, buffer_string);
				ds_list_add(global.Chat_mensagens, [_nome, _msg]); // Adiciona a novo mensagem a lista de mensagens o chat
	
				// Caso haver mais de 10 mensagens no chat
				if (ds_list_size(global.Chat_mensagens) > 10) {
					ds_list_delete(global.Chat_mensagens, 0); // Deleta a 1º mensagem do chat
				}
				
				break;		
				
			case Events_server_client.dados_outros:
				//  { socket_client: [nome, x, y, vida, sprite, image_index] }
				var _struct_json = buffer_read(_buffer, buffer_string);
				var _struct_clients = json_parse(_struct_json);
				var _keys_sockets = struct_get_names(_struct_clients);
				
				// Criar uma instancia (obj_Outro) para cada cliente do map
				for (var i = 0; i < array_length(_keys_sockets); i++) {
					var _key = _keys_sockets[i];
					var _values = _struct_clients[$ _key]

					// Criar instancia
					var _instance = instance_create_layer(_values[1], _values[2], "Personagens", obj_Outro);
					outros_struct[$ _key] = _instance; // Adiciona-lo a struct
					
					with (_instance) {
						nome = _values[0];
						vida = _values[3];
						sprite_index = _values[4];
						image_index = _values[5];
					}
				}
				
				break;
				
			case Events_server_client.novo_cliente:
				// [nome, x, y, vida, sprite, image_index]
				var _client_id = buffer_read(_buffer, buffer_u8);
				var _data = json_parse(buffer_read(_buffer, buffer_string));
				
				var _instance = instance_create_layer(_data[1], _data[2], "Personagens", obj_Outro);
				outros_struct[$ _client_id] = _instance; // Adiciona-lo a struct
				
				with (_instance) {
					nome = _data[0];
					vida = _data[3];
					sprite_index = _data[4];
					image_index = _data[5];
					image_xscale = _data[6];
				}
				
				break;
				
			case Events_server_client.outro_desconectado:
				// Remover instancia do cliente desconectado
				var _outro_des_id = buffer_read(_buffer, buffer_u8);
				instance_destroy(outros_struct[$ _outro_des_id]);
				variable_struct_remove(outros_struct, _outro_des_id);
				
				break;
				
			case Events_server_client.server_desligado:
				show_message("Desconectado! \nO servidor ao qual você estavá conectado está fora do ar.");
				room_goto(Menu);
				break;
		}
		
		break;
	}
