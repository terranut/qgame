
function LargeProgressBar(_x,_y,_width,_height,_value,
					_helpText = "",_maxValue = 100,
					_colorBar = c_red,_colorText = global.font_classic,
					_drawValue = false):GUIElement() constructor{
	
	x = _x;
	y = _y;
	width = _width;
	height = _height;
	value = _value;
	maxValue = _maxValue;
	wrapper = spr_progres_bar_B_void
	colorBar = _colorBar;
	colorText = _colorText;
	font = global.font_classic
	drawValue = _drawValue;

	helpText = _helpText;
	
	static click = function(){};
	
	static draw = function(){
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,1);

		value = clamp(value,0,maxValue);
		var newValue = (100*value)/maxValue;

		var newX = (newValue*(width-7)) / 100;
		newX = newX;

		draw_set_color(colorBar);
		if value > 0 draw_rectangle(x+3,y+3,x+3+newX,y+height-6,0)

		draw_set_color(colorText);
		draw_set_font(font);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
		var text = string(value)+string("/")+string(maxValue)
		if(drawValue) draw_text(x+width/2,y+(height/2)-1,text);

		

		resetFont();	
		
	}
	

}