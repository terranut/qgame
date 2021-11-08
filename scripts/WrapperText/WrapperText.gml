
function WrapperText(_x,_y,_value,
	_wrapper = spr_wrapper_3,
	_innerWrapper = spr_wrapper_8,
	_color = c_dkgray,
	_font = global.font_gold):GUIElement() constructor{
	
	x = _x;
	y = _y;
	width = 200;
	height = 48;
	value = _value;
	color = _color;
	font = _font;
	padding = 38;
	hAlign = fa_center;
	vAlign = fa_middle;
	wrapper = _wrapper;
	innerWrapper = _innerWrapper;
	
	static draw_begin = function(){};
	
	static draw = function(){
		
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		
		var border = 12;
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,1);
		draw_sprite_ext(innerWrapper,0,x+border,y+border,(width-border*2)/sprite_get_width(innerWrapper),(height-border*2)/sprite_get_height(innerWrapper),0,c_white,1);
		
		draw_set_halign(hAlign);
		draw_set_valign(vAlign);
		draw_set_color(color);
		draw_set_font(font);
		width = string_width(value)+padding*2;
		//height = string_height(value)+border*2;
		draw_text(x+width/2,y+height/2,value);
		resetFont()
		
	}


}