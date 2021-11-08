function SimpleText(_x,_y,_value,_width = 100,_color = global.color_black,_font = global.font_gold):GUIElement() constructor{
	x = _x;
	y = _y;
	value = _value;
	color = _color
	font = _font;
	hAlign = fa_center;
	vAlign = fa_middle;
	width = _width;
	
	static click = function(){};
	
	static draw = function(){
		
		draw_set_halign(hAlign);
		draw_set_valign(vAlign);
		draw_set_color(color);
		draw_set_font(font);
		draw_text_ext(x+width/2,y+32,value,16,width-padding*2)
		resetFont()
		
	}
	
	
	
}

