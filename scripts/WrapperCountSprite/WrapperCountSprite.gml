
function WrapperCountSprite(_x,_y,_spr,_text,_value,_help = ""):GUIElement() constructor{
	
	x = _x;
	y = _y;
	
	spr = _spr;
	value = _value;
	text = _text;
	wrapper = spr_wrapper_15
	width = get_width()
	height = 25;
	help = _help;
	helpTextWrapper = undefined;
	
	if(string_length(help)){
		helpTextWrapper = new HelpText(x,y,width+16,help)	
	}
	
	static draw_element = function(){
		
		var ww = x + 8
		draw_set_font(global.font_classic_margin)
		draw_set_halign(fa_left)
		draw_set_valign(fa_middle)
		draw_set_color(c_white)
		draw_text(ww,y+ height/2,text)
		
		ww += string_width(text)+16
		var xOff = sprite_get_xoffset(spr);
		var yOff = sprite_get_yoffset(spr);
		sprite_set_offset(spr,sprite_get_width(spr)/2,sprite_get_height(spr)/2);
		draw_sprite(spr,0,ww,y+height/2);
		sprite_set_offset(spr,xOff,yOff);
		
		
		ww += sprite_get_width(spr)
		draw_set_font(global.font_gold)
		draw_text(ww,y+height/2,value)
		
		resetFont()
	
	}
	
	
	static click = function(){
		if(!helpTextWrapper) exit;
		if(helpTextWrapper.open){
			helpTextWrapper.open = false
		}else{
			with(oGuiController) if(gui.name == "HelpText") gui.open = false;
			helpTextWrapper.open = true
		}
		
	}
	
	static get_width = function(){
		var ww = 8
		draw_set_font(global.font_classic_margin)
		draw_set_halign(fa_left)
		draw_set_valign(fa_middle)
		ww += string_width(text)+16
		ww += sprite_get_width(spr)
		ww += string_width(value) +8
		return ww;
		
	}

}