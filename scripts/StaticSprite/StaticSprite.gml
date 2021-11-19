
function StaticSprite(_x,_y,_spr,_subSpr = 0,_helpText = ""):GUIElement() constructor{
	x = _x;
	y = _y;
	sprite = _spr;
	subImage = _subSpr
	width = sprite_get_width(sprite)
	height = sprite_get_height(sprite)
	helpText = _helpText;

	
	
	static draw_element = function(){
		var xOff = sprite_get_xoffset(sprite);
		var yOff = sprite_get_yoffset(sprite);
		sprite_set_offset(sprite,sprite_get_width(sprite)/2,sprite_get_height(sprite)/2);
		draw_sprite(sprite,subImage,x,y);
		sprite_set_offset(sprite,xOff,yOff);
		
	}
	
	
	static step_element = function(){
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		hover = point_in_rectangle(mouseX,mouseY,x-width/2,y-height/2,x+width/2,y+height/2);
		if(mouse_check_button_pressed(mb_left) && point_in_rectangle(mouseX,mouseY,x-width/2,y-height/2,x+width/2,y+height/2)){
			click();
		}	
	}
	
}
