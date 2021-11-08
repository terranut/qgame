
function LabelText(_x,_y,_value,
				_padding = 16,
				_font = global.font_gold,
				_color = global.color_black,
				_wrapper = spr_wrapper_8):GUIElement() constructor{
					
	type = "LabelText";
	x = _x;
	y = _y;
	width = 1;
	height = 1;
	value = _value;
	padding = _padding;
	hAlign = fa_center;
	vAlign = fa_middle;
	wrapper = _wrapper;
	font = _font;
	color = _color;
	
	draw_set_font(font);
	width = string_width(value)+padding;
	
	static click = function(){};
			
	static draw = function(){
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,1)
		
		draw_set_halign(hAlign);
		draw_set_valign(vAlign);
		draw_set_color(color);
		draw_set_font(font);
		
		height = string_height(value)+padding;
		draw_text(x+width/2,y+height/2,value);
		resetFont()
		
	}
	
	
	
}