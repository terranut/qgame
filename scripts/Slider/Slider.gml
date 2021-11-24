function Slider(_x,_y,_name,_width = 100,_value = 75,_maxValue = 100,_wrapper = spr_wrapper_14,_innerColor = c_white):GUIElement() constructor{
	x = _x;
	y = _y;
	name = _name;
	color = global.color_black;
	width = _width
	height = 18;
	value = _value;
	maxValue = _maxValue;
	wrapper = _wrapper;
	innerColor = _innerColor;
	
	//static click = function(){
	//}
	
	static draw_element = function(){
		value = clamp(value,0,maxValue);
		var newValue = (100*value)/maxValue;
		var newX = (newValue*(width)) / 100;
		
		draw_set_color(innerColor)
		draw_roundrect_ext(x,y+1,x+(newX),y+height-1,10,10,0);
		resetFont()
		
		draw_set_font(font_m5)
		if(value < maxValue/2) draw_set_color(c_white)
		else draw_set_color(global.color_black)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text(x+(width/2),y+(height/2)-2,value)
		resetFont()
	}
	
	static draw_wrapper = function(){
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,wrapperAlpha);	
	}
	
	static step_element = function(){
		print(hover)
		if(hover && mouse_check_button(mb_left))
			value = mouse_x - x
	}
	
	
	
}

