
function GUIElement() constructor{
	typeElement = "GUIElement";
	width = 10;
	height = 10;
	hover = false;
	helpText = "";
	padding = 16;
	color = global.color_black;
	font = global.font_gold;
	value = undefined;
	userInput = "pad";
	elementVisible = true;
	disable = false;
	name = "GUIElement";
	
	static has_focus = function(){  };
	static set_focus = function(){  };
	static get = function() { return value; }
    static set = function(_value) { value = _value; }
	
	static click = function(){
		if(disable) exit;
		set_focus();
	};
	
	static extra_step = function(){}
	static step = function(){
		
		extra_step();
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		hover = point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height);
		if(mouse_check_button_pressed(mb_left) && point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height)){
			click();
		}	
	}
	
	
	
	
	static draw = function(){};
	
	static draw_end = function(){
		if(has_focus() && userInput == "pad") draw_rectangle(x,y,x+width-1,y+height-1,1);
		if(hover && string_length(helpText)){
			draw_set_color(c_white);
			draw_set_font(font_m5);
			draw_text(16,540-32,helpText);
			resetFont();	
		}
	}
	
	static destroy = function(){};
	
	
	static toString = function(){ return typeElement }

}