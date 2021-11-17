
function TextExt(_x,_y,_width = 100,_text,_font = font_m5,_color = c_white):GUIElement() constructor{
	name = "TextExt"
	width = _width
	height = 10
	x = _x;
	y = _y;
	text = _text;
	font = _font;
	color = _color;
	separation = 12;
	
	padding = 5;
	
	static draw_element = function(){
		draw_set_font(font)
		draw_set_color(color)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top);
		height = string_height_ext(text,separation,width-padding) + padding*2
		
		//WRAPPER
		var wrap = spr_wrapper_15
		var wrapperW = sprite_get_width(wrap);
		var wrapperH = sprite_get_height(wrap);
		draw_sprite_ext(wrap,0,x,y,width/wrapperW,height/wrapperH,0,c_white,1);
		draw_text_ext(x+padding,y+padding,text,separation,width-padding)
	}
	
	static get_height = function(){
		draw_set_font(font)
		draw_set_color(color)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top);
		return string_height_ext(text,separation,width-padding) + padding*2
	}
	
	
	
}