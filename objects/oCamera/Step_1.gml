/// @description 


full_screen = window_get_fullscreen();


if(display_width >= 1920 && display_height >= 1080){
	if(full_screen)	surface_resize (application_surface, 1920,1080)
	else surface_resize (application_surface, 960,540)
	x_offset = (display_width - 1920) / 2;
	y_offset = (display_height - 1080) / 2;
	display_set_gui_size(960,540);
}else{
	surface_resize (application_surface, 960,540)
	x_offset = 0;
	y_offset =0
	display_set_gui_size(960,540);
	display_set_gui_maximize(1,1,x_offset,y_offset)
}












