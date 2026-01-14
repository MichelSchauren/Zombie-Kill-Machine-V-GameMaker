// Destruir instancia do inimigo
instance_destroy();

if (global.Multiplayer and instance_exists(obj_Client_tcp)) {
	struct_remove(obj_Client_tcp.inimigos_struct, inimigo_id);
}