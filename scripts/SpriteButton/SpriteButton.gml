
function SpriteButton(_x,_y,_spr,_helpText,_action):GUIElement() constructor{
	x = _x;
	y = _y;
	spr = _spr;
	width = sprite_get_width(spr);
	height = sprite_get_height(spr);
	action = _action;
	helpText = _helpText;

	
	static click = function(){
		if(disable) exit;
		action();
	}
	
	static draw_element = function(){
		if(hover) draw_sprite(spr,1,x,y)
		else draw_sprite(spr,0,x,y)
		
	}
	
	static step_element = function(){
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		
		hover = point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height);
		if( mouse_check_button(mb_left) && hover) set_focus();
		if(mouse_check_button_released(mb_left) && point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height)){
			click();
		}	
	}
	

}