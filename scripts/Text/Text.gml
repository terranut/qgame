
function Text(_x,_y,_value = 0,_color = c_white,_font = global.font_gold,_hAlign = fa_left, _vAlign = fa_middle):GUIElement() constructor{
	x = _x;
	y = _y;
	value = _value;
	color = _color
	font = _font;
	hAlign = _hAlign;
	vAlign = _vAlign;
	
	static click = function(){};
	
	static draw = function(){
		draw_set_halign(hAlign);
		draw_set_valign(vAlign);
		draw_set_color(color);
		draw_set_font(font);
		draw_text(x,y,value);
		width = string_width(value);
		height = string_height(value);
		resetFont()
		
	}
	
}