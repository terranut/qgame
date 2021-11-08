/// @description 
if(global.settings.lang == "en") image_index = 0;
else if(global.settings.lang == "es") image_index = 1;


var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);
hover = point_in_rectangle(mouseX,mouseY,x,y, x+sprite_width,y+sprite_height);

leftClick = mouse_check_button(mb_left)
if(hover && leftClick && changeEnabled){
	changeEnabled = false;
	alarm[0] = 60;
	print("CLICK")
	
	if(global.settings.lang == "es") global.settings.lang = "en";
	else if(global.settings.lang == "en") global.settings.lang = "es";
	global.displayValues = readJson( global.settings.lang + ".json");
	alarm[1] = 15;
	
}



