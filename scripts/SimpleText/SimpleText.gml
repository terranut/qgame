function SimpleText(_x,_y,_value,_width = 100,_color = global.color_black,_font = global.font_gold,_hAlign = fa_center, _vAlign = fa_middle,_sep = 16):GUIElement() constructor{
	x = _x;
	y = _y;
	value = _value;
	color = _color
	font = _font;
	hAlign = _hAlign;
	vAlign = _vAlign;
	width = _width;
	separation = _sep
	
	
	static click = function(){};
	
	static draw_element = function(){
		
		draw_set_halign(hAlign);
		draw_set_valign(vAlign);
		draw_set_color(color);
		draw_set_font(font);
		//draw_circle(x,y,3,1)
		draw_text_ext(x,y,value,separation,width)
		resetFont()
		
	}
	
	static get_height = function(){
		var hh = 0;
		draw_set_halign(hAlign);
		draw_set_valign(vAlign);
		draw_set_font(font);
		hh = string_height_ext(value,separation,width);
		return hh;
		
	}
	
	
	
}

