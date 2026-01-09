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
					_instance.nome = _values[0];
					_instance.vida = _values[3];
					_instance.sprite_index = _values[4];
					_instance.image_index = _values[5];
					outros_struct[$ _key] = _instance; // Adiciona-lo a struct
				}
				
				break;
				
			case Events_server_client.novo_cliente:
				// [nome, x, y, vida, sprite, image_index]
				var _client_id = buffer_read(_buffer, buffer_u8);
				var _data = json_parse(buffer_read(_buffer, buffer_string));
				
				var _instance = instance_create_layer(_data[1], _data[2], "Personagens", obj_Outro);
				_instance.nome = _data[0];
				_instance.vida = _data[3];
				_instance.sprite_index = _data[4];
				_instance.image_index = _data[5];
				_instance.image_xscale = _data[6];
				outros_struct[$ _client_id] = _instance; // Adiciona-lo a struct
				
				break;
		
			case Events_server_client.mudar_outro:
				var _socket_outro = buffer_read(_buffer, buffer_u8);				
				var _outro = outros_struct[$ _socket_outro];				
				_outro.x = buffer_read(_buffer, buffer_u16);
				_outro.y = buffer_read(_buffer, buffer_u16);
				_outro.vida =buffer_read(_buffer, buffer_u8);
				_outro.sprite_index =buffer_read(_buffer, buffer_u8);
				_outro.image_index = buffer_read(_buffer, buffer_u8);
				_outro.image_xscale = buffer_read(_buffer, buffer_f16);
			
				break;
		
			case Events_server_client.novo_tiro:
				var _tiro_x = buffer_read(_buffer, buffer_u16);
				var _tiro_y = buffer_read(_buffer, buffer_u16);
				var _tiro_dir = buffer_read(_buffer, buffer_u16);
				
				var _tiro_instance = instance_create_layer(_tiro_x, _tiro_y, "Projeteis", obj_Tiro);
				_tiro_instance.direction = _tiro_dir;
			
				break;
				
			case Events_server_client.novo_chat:
				var _nome = buffer_read(_buffer, buffer_string);
				var _msg = buffer_read(_buffer, buffer_string);
				ds_list_add(obj_Chat.mensagens, [_nome, _msg]); // Adiciona a novo mensagem a lista de mensagens o chat
	
				// Caso haver mais de 10 mensagens no chat
				if (ds_list_size(obj_Chat.mensagens) > 10) {
					ds_list_delete(obj_Chat.mensagens, 0); // Deleta a 1º mensagem do chat
				}
				
				break;
				
			case Events_server_client.outro_desconectado:
				// Remover instancia do cliente desconectado
				var _outro_des_id = buffer_read(_buffer, buffer_u8);
				instance_destroy(outros_struct[$ _outro_des_id]);
				variable_struct_remove(outros_struct, _outro_des_id);
				
				break;
				
			case Events_server_client.atualizar_ping:
				var _tempo_envio = buffer_read(_buffer, buffer_u32);
				ping = current_time - _tempo_envio;
				alarm[1] = fps*5;
				break;
				
			case Events_server_client.server_desligado:
				show_message("Desconectado! \nO servidor ao qual você estavá conectado está fora do ar.");
				room_goto(Menu);
				break;
		}
		
		break;
	}
