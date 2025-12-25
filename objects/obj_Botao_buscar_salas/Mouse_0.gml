// Apagar lista de servidores
ds_list_clear(obj_Salas.ips);
instance_destroy(obj_Sala);

// Solicitar informações dos servidores disponíveis na rede (Infos: IP, porta, ent...)
var _data = buffer_create(32, buffer_fixed, 1);
buffer_write(_data, buffer_u8, 0x01);
network_send_broadcast(obj_Client_udp.socket_udp, global.porta_udp, _data, buffer_get_size(_data));
buffer_delete(_data);