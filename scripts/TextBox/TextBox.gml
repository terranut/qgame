function TextBox(_x,_y,_text,_width,_font = font_m5,_colorText = c_white):GUIElement() constructor{
	x = _x;
	y = _y;
	width = _width;
	height = 10;
	font = _font;
	colorText = _colorText
	text = _text;
	
	
	draw_set_font(font)
	height = string_height_ext(text,16,width-10) + 10
	resetFont()
	

	
	static draw_element = function(){
	
		draw_set_color(c_white)
		draw_set_alpha(.2)
		draw_rectangle(x,y,x+width,y+height,0)
		
		resetFont()

		draw_set_font(font)
		draw_set_color(colorText)
		draw_text_ext(x+10,y+5,text,16,width-10);
		resetFont()
		
	}
	
	
	
}

