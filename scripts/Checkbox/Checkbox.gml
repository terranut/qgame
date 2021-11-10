function Checkbox(_x,_y,_name,_checked,_action):GUIElement() constructor{
	x = _x;
	y = _y;
	name = _name;
	action = _action;
	color = global.color_black;
	
	draw_set_font(font);
	width = string_width(_name)+padding*2;
	height = 18;
	
	static click = function(){
		set_focus();
		set(action());
	}
	
	static draw_element = function(){
	
		var sprW = sprite_get_width(spr_wrapper_4);
		var sprH = sprite_get_height(spr_wrapper_4);
		
		draw_sprite_ext(spr_wrapper_4,0,x,y,16/sprW,16/sprH,0,c_white,1);
		
		if(get()) draw_sprite(spr_icons,7,x+8,y+7);
		 
		draw_set_valign(fa_left);
		draw_set_valign(fa_middle);
		draw_text(x+ padding *2, y + 8,name);
		resetFont()
		
	}
	
	set(_checked);
	
}

