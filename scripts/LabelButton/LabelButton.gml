
function LabelButton(_x,_y,_value,_helpText,_action,_font = global.font_gold,_color = global.color_black,_hAlign = fa_left,_vAlign = fa_middle, _width = 48, _height = 20):GUIElement() constructor{
	x = _x;
	y = _y;
	width = _width;
	height = _height;
	action = _action;
	value = _value;
	wrapper = spr_wrapper_12;
	helpText = _helpText;
	color = _color;
	font = _font;
	hAlign = _hAlign;
	vAlign = _vAlign;
	
	
	static click = function(){
		set_focus();
		action();
	}
	
	static draw_end = function(){}
	
	static draw_element = function(){
		
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,1);
		
		if(hover) color = global.color_darkblue
		else color = global.color_black;
		draw_set_halign(hAlign);
		draw_set_valign(vAlign);
		draw_set_color(color)
		draw_set_font(font);
		draw_text(x+8,y+7,value);
		resetFont()
	
		
	}
	
	
	static step_element = function(){
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		
		hover = point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height);
		if( mouse_check_button(mb_left) && hover) set_focus();
		if(mouse_check_button_released(mb_left) && point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height)){
			click();
		}	
	}
	

}