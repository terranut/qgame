
function TextButton(_name,_x,_y,_action,_width = "auto",_icon = undefined,_font = global.font_classic):GUIElement() constructor{
	x = _x;
	y = _y;
	name = _name;
	action = _action;
	height = 28;
	icon = _icon;
	font = _font;
	color = global.color_white
	soundHover = snd_hover_btn
	soundClick = snd_click_button
	
	draw_set_font(font);
	if(_width == "auto") width = string_width(name)+padding;
	else width = _width;
	
	static click = function(){
		if(disable) exit;
		set_focus();
		action();
	}
	
	static draw_element = function(){
		var alpha = 1;
		//if(disable) alpha = .5;
		//else alpha = 1;
		
		//WRAPPER
		if( mouse_check_button(mb_left) && hover && !disable ) wrapper = spr_wrapper_16;
		else wrapper = spr_wrapper_19;
	
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,alpha);
		
		if(icon) draw_sprite_ext(spr_icons,icon,x+(width/2) - (string_width(name)/2) ,y+height/2,1,1,0,color,alpha)
		
		
		//TEXT
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(alpha)
		draw_set_color(color);
		draw_set_font(font)
		if(hover && !disable) draw_set_color(color);
		else draw_set_color(color);
		if (icon) draw_text(x+(width/2)+8, y+height/2 ,name);
		else  draw_text(x+(width/2), y+height/2 ,name);
		resetFont()
	}
	
	
	static step_element = function(){
		if(hover) color = c_white
		else color = global.color_white
	}
	
	

}