
function WrapperText(_x,_y,_value,_wrapper = spr_wrapper_3):GUIElement() constructor{
	x = _x;
	y = _y;
	width = 10;
	height = 10;
	value = _value;
	wrapper = _wrapper
	
	padding = 8;
	
	
	
	static draw_element = function(){
		
		
		//WRAPPER
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,1);
		
		
	}

}