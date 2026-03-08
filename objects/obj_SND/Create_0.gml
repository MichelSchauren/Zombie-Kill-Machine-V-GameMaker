audio_controller = new AudioController("VOL_SFX", "VOL_MUSIC", "VOL_MASTER");

// effects
UI_click1_sfx = new AudioPlaySingle(sfx_UI_click_1, au_type_sfx);
UI_click2_sfx = new AudioPlaySingle(sfx_UI_click_2, au_type_sfx);

disparo_sfx = new AudioPlaySingle(sfx_Disparo, au_type_sfx);
flecha_sfx = new AudioPlaySingle(sfx_Flecha, au_type_sfx);

zombi1_sfx = new AudioPlaySingle(sfx_Zumbi_1, au_type_sfx);
zombi2_sfx = new AudioPlaySingle(sfx_Zumbi_2, au_type_sfx);
zombi3_sfx = new AudioPlaySingle(sfx_Zumbi_3, au_type_sfx);

failed_sfx = new AudioPlaySingle(sfx_You_fail, au_type_sfx);

// musics
menu_music = new AudioPlaySingle(music_Menu, au_type_music, 1, true);
gameplay_music = new AudioPlaySingle(music_GamePlay, au_type_music, 1, true);
credits_music = new AudioPlaySingle(music_Credits, au_type_music, 1, true);
