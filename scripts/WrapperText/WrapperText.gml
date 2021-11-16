
function WrapperText(_x,_y,_value,_wrapper = spr_wrapper_3):GUIElement() constructor{
	x = _x;
	y = _y;
	width = 150;
	height = 50;
	value = _value;
	wrapper = _wrapper
	
	
	padding = 8;
	
	//content = new SimpleText(x+padding*2,y+padding+5,value,width-padding*2,c_white,font_m5,fa_left,fa_top,12)
	//height = content.get_height()+padding + 26;
	//back = new Wrapper(x,y,width,height,wrapper)
	//backText = new Wrapper(x+padding,y+padding,width-padding*2,height-padding*2,innerWrapper,1)
	
	//elements = [back,backText,content]
	
	static draw_element = function(){
		
		
		//WRAPPER
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,1);
		
		
	}

}