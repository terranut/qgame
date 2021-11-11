/// @description
if(global.glow){
	

	if(!surface_exists(lighting)) {
	    lighting = surface_create(room_width,room_height);
	}


	surface_set_target(lighting);
	
	draw_set_color(c_black);
	draw_rectangle(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),false);
	resetFont()
	
	gpu_set_blendmode(bm_add);
	with(oLight) {
		draw_circle_colour(x+xOffset-camera_get_view_x(view),y+yOffset-camera_get_view_y(view),radius,col,c_black,false);
	}
	
	gpu_set_blendmode(bm_max);
	with(oNpc){
		draw_set_alpha(.9)
		if(npc.focus) draw_circle_colour(x-camera_get_view_x(view),y-10-camera_get_view_y(view),50,npc.lightColor,c_black,false);
		draw_set_alpha(1)
	}
	
	
	with(oGuiController){
		if(gui && gui.glow) draw_rectangle_colour(x+1 -camera_get_view_x(view),y+13-camera_get_view_y(view),x+(gui.width-2)-camera_get_view_x(view), (y+30)-camera_get_view_y(view), global.color_yellow,global.color_yellow, c_black, c_black, false);
	}
	
	
	gpu_set_blendmode(bm_normal);
	
	surface_reset_target();
	
	shader_set(sh_lighting);
	
	var tex = surface_get_texture(lighting);
	var handle = shader_get_sampler_index(sh_lighting,"lighting");
	texture_set_stage(handle,tex);

	draw_surface_ext(application_surface,global.x_offset, global.y_offset, 1,1,0, c_white, 1);

	shader_reset();

}else draw_surface_ext(application_surface,global.x_offset, global.y_offset, 1,1,0, c_white, 1);