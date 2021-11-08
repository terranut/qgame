
function CountIcon(_x,_y,_icon,_subImg,_count,_helpText = "",_width = 60, _height = 20,_font = global.font_classic,_color = global.color_black):GUIElement() constructor{
	x = _x;
	y = _y;
	value = _count;
	icon = _icon;
	subImage = _subImg;
	color = _color;
	font = _font
	helpText = _helpText;
	width = _width;
	height = _height;
	
	
	static click = function(){}
	
	static draw = function(){
		var sprW = sprite_get_width(spr_wrapper_8);
		var sprH = sprite_get_height(spr_wrapper_8);
		
		draw_sprite_ext(spr_wrapper_8,0,x,y,width/sprW,height/sprH,0,c_white,1);
		
		
		var xOff = sprite_get_xoffset(icon);
		var yOff = sprite_get_yoffset(icon);
		sprite_set_offset(icon,sprite_get_width(icon)/2,sprite_get_height(icon)/2);
		draw_sprite(icon,subImage,x+16,y+height/2);
		sprite_set_offset(icon,xOff,yOff);
		
		 
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		draw_set_color(color)
		draw_set_font(font);
		draw_text(x+width-10,y+height/2,value);
		resetFont()
		
	}
	
}