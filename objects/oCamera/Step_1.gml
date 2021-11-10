/// @description 
full_screen = window_get_fullscreen()
if(display_width != 1920 && display_height != 1080){
	window_set_fullscreen(false)
}

if(display_width == 1920 && display_height == 1080){
	
	if(full_screen) surface_resize (application_surface, 1920,1080)
	else surface_resize (application_surface, 960,540)
	global.x_offset = 0
	global.y_offset = 0
	display_set_gui_size(960,540);
}else if(display_width < 1920 && display_height < 1080) {
	
	surface_resize (application_surface, 960,540)
	if(full_screen){
		global.x_offset = (display_width/2) - (base_width/2)
		global.y_offset = (display_height/2) - (base_height/2)
	}else{
		global.x_offset = 0
		global.y_offset = 0
	}
	
	display_set_gui_size(960,540);
	display_set_gui_maximize(1,1,global.x_offset,global.y_offset)

}












