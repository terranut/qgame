
function CountSprite(_x,_y,_spr,_count,_helpText = "",_color = c_white,_font = global.font_gold):GUIElement() constructor{
	x = _x;
	y = _y;
	value = _count;
	sprite = _spr;
	color = _color;
	font = _font;
	helpText = _helpText;
	
	draw_set_font(font)
	width = sprite_get_width(sprite)+5+string_width(value);
	resetFont()
	
	static draw = function(){
	
		var xOff = sprite_get_xoffset(sprite);
		var yOff = sprite_get_yoffset(sprite);
		sprite_set_offset(sprite,sprite_get_width(sprite)/2,sprite_get_height(sprite)/2);
		draw_sprite(sprite,0,x,y);
		sprite_set_offset(sprite,xOff,yOff);
		
		 
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_color(c_white)
		draw_set_font(font)
		draw_text(x+sprite_get_width(sprite)+5,y,value);
		resetFont()
		
		
	}
	
}