last_width = window_get_width();
last_height = window_get_height();

// Obter as dimensões atuais da janela
var _w = min (window_get_width(), 1580);
var _h = min (window_get_height(), 720);

camera_set_view_size(view_camera[0], _w, _h);
surface_resize(application_surface, _w, _h);
camera_set_view_border(view_camera[0], _w/2, _h/2);
