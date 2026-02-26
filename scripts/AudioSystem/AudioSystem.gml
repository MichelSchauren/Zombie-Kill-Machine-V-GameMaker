#macro au_type_sfx		"SFX"
#macro au_type_music	"MUSIC"

function AudioController(_str_sfx, _str_music, _str_master) constructor {
	global.__audio_controller__ = self;
	list_audio = ds_list_create();
	
	global_sfx		= _str_sfx;
	global_music	= _str_music;
	global_master	= _str_master;
	
	static Update = function() {
		vol_sfx = variable_global_get(global_sfx) * variable_global_get(global_master);
		vol_music = variable_global_get(global_music) * variable_global_get(global_master);
		
		var _size = ds_list_size(list_audio);
		for (var i = 0; i < _size; i++) {
			list_audio[| i].Update();
		}
	}
}


function AudioElement() constructor {
	controller = global.__audio_controller__;
	
	// Se adicionar na lista de aúdio
	ds_list_add(controller.list_audio, self);
	
	play		= false;
	sound_id	= noone;
	type		= noone;
	offset		= 1;
	loop		= false;
	
	///@method Update
	static Update = function() {
		// Coloquei para tocar
		if (play) {
			// Tocando de fato
			if (!global.MUTED) {
				var _snd = audio_play_sound(sound_id, 0, loop);
			
				// Descobrindo o volume
				var _level;
				if (type == au_type_sfx) {
					_level = controller.vol_sfx = offset;
				} else {
					_level = controller.vol_music = offset;
				}
			
				// Definindo o volume de fato
				audio_sound_gain(_snd, _level, 0);
			}
			
			play = false;
		}
	}
}


function AudioPlaySingle (_sound_id, _au_type, _offset = 1, _loop = false) : AudioElement() constructor {
	sound_id = _sound_id;
	type = _au_type;
	offset = _offset;
	loop = _loop;
}