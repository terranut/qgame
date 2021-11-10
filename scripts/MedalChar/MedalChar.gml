
function MedalChar(_x,_y,_value):GUIElement() constructor{
	
	x = _x;
	y = _y;
	value = _value;
	wrapper = spr_wrapper_13;
	width = 38;
	height = 38;
	
	static click = function(){};

	static draw_element = function(){
		//WRAPPER
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,1);
		
		draw_set_font(global.font_title);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		
		draw_text(x+(width/2),y+(height/2),value);
		resetFont();
		
	}

}