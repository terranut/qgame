
function WrapperCountSimple(_x,_y,_spr,_count,_help = ""):GUIElement() constructor{
	x = _x;
	y = _y;
	value = _count;
	spr = _spr;
	
	color = c_white
	font = global.font_gold

	width = 50
	height = 25;
	
	
	static click = function(){}
	
	static draw_element = function(){
		
		if(hover) alpha = .5
		else alpha = 1;

		var wrap = spr_wrapper_15
		//WRAPPER
		var wrapperW = sprite_get_width(wrap);
		var wrapperH = sprite_get_height(wrap);
		draw_sprite_ext(wrap,0,x,y,width/wrapperW,height/wrapperH,0,c_white,alpha);
		
		
		var xOff = sprite_get_xoffset(spr);
		var yOff = sprite_get_yoffset(spr);
		sprite_set_offset(spr,sprite_get_width(spr)/2,sprite_get_height(spr)/2);
		draw_sprite(spr,0,x+16,y+height/2);
		sprite_set_offset(spr,xOff,yOff);
		
		 
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		draw_set_color(color)
		draw_set_font(font);
		draw_text(x+width-10,y+height/2,value);
		resetFont()
		
	}
	
}