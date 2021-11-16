
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
	
	focusPig = undefined;
	
	
	static has_focus = function(){ 
		if(other.gui) return (other.gui.instance.elementInFocus == self) 
		else return (other.elementInFocus == self) 
	};
		
	static set_focus = function(){ 
		with(oGuiController) elementInFocus = undefined;
		
		if(other.gui) other.gui.instance.elementInFocus = self  
		else other.elementInFocus = self
	};
	static get = function() { return value; }
    static set = function(_value) { value = _value; }
	
	static click = function(){
		if(disable) exit;
		set_focus();
		
		if(focusPig != undefined && string_length(focusPig)) click_pig()
	};
	
	static click_pig = function(){
		print("click pig")
		with(oNpcPig) if(npc.name == other.focusPig) npc.set_focus()	
	}
	

	static step = function(){
		if(!elementVisible) exit;
		step_element()
	}
	
	static step_element = function(){
		
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		hover = point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height);
		if(mouse_check_button_pressed(mb_left) && point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height)){
			click();
		}	
	}
	
	
	
	static draw = function(){
		if(!elementVisible) exit;
		draw_element()
		draw_end()
	};
	static draw_element = function(){}
	
	static draw_end = function(){
		//if(has_focus() && userInput == "pad") draw_rectangle(x,y,x+width-1,y+height-1,1);
		if(hover && string_length(helpText)){
			draw_set_color(c_white);
			draw_set_font(font_m5);
			draw_text(16,540-32,helpText);
			resetFont();	
		}
	}
	
	static destroy = function(){};
	
	
	

}