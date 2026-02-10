var _id = ds_map_find_value ( async_load , "id" );
if (_id == msg) {
	if (ds_map_find_value(async_load, "status")) {
		url_open("https://github.com/MichelSchauren/Zombie-Kill-Machine-V-GameMaker/releases");
	}
}