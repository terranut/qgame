
function WrapperProgress(_x,_y,_spr,_value,_help = ""):GUIElement() constructor{
	x = _x;
	y = _y;
	
	spr = _spr;
	value = _value;
	
	alpha = 1;
	
	width = 110
	height = 25;
	help = _help;
	helpTextWrapper = undefined;
	helpTextWrapper = undefined;
	
	if(string_length(help)){
		helpTextWrapper = new HelpText(x,y,width+16,help)	
	}
	
	static draw_element = function(){
		
		if(hover) alpha = .5
		else alpha = 1;

		var wrap = spr_wrapper_15
		//WRAPPER
		var wrapperW = sprite_get_width(wrap);
		var wrapperH = sprite_get_height(wrap);
		draw_sprite_ext(wrap,0,x,y,width/wrapperW,height/wrapperH,0,c_white,alpha);
		
		
		var ww = x + 10
		var xOff = sprite_get_xoffset(spr);
		var yOff = sprite_get_yoffset(spr);
		sprite_set_offset(spr,sprite_get_width(spr)/2,sprite_get_height(spr)/2);
		draw_sprite(spr,0,ww,y+height/2);
		sprite_set_offset(spr,xOff,yOff);
		
		ww += sprite_get_width(spr)+5
		draw_progress_bar(ww,y+8);
		
		
		draw_set_font(global.font_classic_margin)
		draw_set_halign(fa_left)
		draw_set_valign(fa_middle)
		draw_set_color(c_white)
		ww += 60
		draw_set_font(global.font_gold)
		draw_text(ww,y+height/2,value)
		
		resetFont()
	
	}
	
	static draw_progress_bar = function(_x,_y){
		
		var xx = _x
		var yy = _y;
		
		var drawValue = true;
		var maxValue = 100;
		var colorBar = global.color_red
		var colorText = c_white;
		var font = global.font_gold
		
		var width = 50;
		var height = 10
		
		var wrap = spr_progres_bar_void
		
		var wrapperW = sprite_get_width(wrap);
		var wrapperH = sprite_get_height(wrap);
		draw_sprite_ext(wrap,0,xx,yy,width/wrapperW,height/wrapperH,0,c_white,1);

		value = clamp(value,0,maxValue);
		var newValue = (100*value)/maxValue;

		var newX = (newValue*(width-7)) / 100;
		newX = newX;

		draw_set_color(colorBar);
		if value > 0 draw_rectangle(xx+3,yy+3,xx+3+newX,yy+height-4,0)

		draw_set_color(colorText);
		draw_set_font(font);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
	
		//var text = string(value)+string(" ")+string(maxValue)
		//if(drawValue) draw_text(xx+width/2,yy+(height/2)-1,text);

		resetFont();	
		
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
	
	
}