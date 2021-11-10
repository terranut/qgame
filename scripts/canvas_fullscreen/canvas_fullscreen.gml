// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function canvas_fullscreen(argument0) {

	var _base = argument0;
	var _bw = browser_width;
	var _bh = browser_height;

	view_wport[0] = _bw;
	view_hport[0] = _bh;

	window_set_size(_bw, _bh);
	window_center();

	var _aspect = (_bw / _bh);
	if (_aspect < 1)
	    {
		var _vw = _base * _aspect;
		var _vh = _base;
	    }
	else
	    {
	    _vw = _base;
	    _vh = _base / _aspect;
	    }
	
	camera_set_view_size(view_camera[0], _vw, _vh);
	display_set_gui_size(_vw,_vh);
	surface_resize(application_surface, view_wport[0], view_hport[0]);


}
