
function WrapperCountSprite(_x,_y,_spr,_text,_value):GUIElement() constructor{
	
	x = _x;
	y = _y;
	
	spr = _spr;
	value = _value;
	text = _text;
	alpha = 1;
	
	width = get_width()
	height = 25;
	helpTextWrapper = new HelpText(x,y,width)
	
	static draw_element = function(){
		
		if(hover) alpha = .5
		else alpha = 1;

		var wrap = spr_wrapper_15
		//WRAPPER
		var wrapperW = sprite_get_width(wrap);
		var wrapperH = sprite_get_height(wrap);
		draw_sprite_ext(wrap,0,x,y,width/wrapperW,height/wrapperH,0,c_white,alpha);
		
		
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
		print("ANCHO",ww)
		return ww;
		
	}

}