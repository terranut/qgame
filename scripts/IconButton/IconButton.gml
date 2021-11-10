
function IconButton(_x,_y,_icon,_helpText,_action,_width = 16, _height = 16):GUIElement() constructor{
	x = _x;
	y = _y;
	width = _width;
	height = _height;
	action = _action;
	wrapper = spr_wrapper_4;
	icon = _icon;
	helpText = _helpText;

	
	static click = function(){
		
		action();
	}
	
	static draw_element = function(){
		
		if( mouse_check_button(mb_left) && has_focus() ) wrapper = spr_wrapper_4_pressed;
		else wrapper = spr_wrapper_4;
		
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,1);
		
		if(width == 16) draw_sprite_ext(spr_icons,icon,x+8,y+7,1,1,0,c_white,1) 
		else draw_sprite_ext(spr_icons,icon,x+width/2,y+7,1,1,0,c_white,1)
	
		
	}
	
	static step = function(){
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		
		hover = point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height);
		if( mouse_check_button(mb_left) && hover) set_focus();
		if(mouse_check_button_released(mb_left) && point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height)){
			click();
		}	
	}
	

}