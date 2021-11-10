
function scale_canvas(argument0, argument1, argument2, argument3, argument4) {
	print("scale canvas")
	var _bw = argument0;
	var _bh = argument1;
	var _cw = argument2;
	var _ch = argument3;
	var _center = argument4;
	var _aspect = (_bw / _bh);

	if ((_cw / _aspect) > _ch)
	    {
	    window_set_size((_ch *_aspect), _ch);
	    }
	else
	    {
	    window_set_size(_cw, (_cw / _aspect));
	    }
	if (_center)
	    {
	    window_center();
	    }

	view_wport[0] = min(window_get_width(), _bw);
	view_hport[0] = min(window_get_height(), _bh)
	surface_resize(application_surface, view_wport[0], view_hport[0]);


}
