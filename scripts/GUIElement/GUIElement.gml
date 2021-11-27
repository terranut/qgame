
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
	wrapper = undefined;
	wrapperAlpha = 1;
	
	soundHover = undefined;
	soundClick = undefined;
	onButton = false;
	
	
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
	};
	

	static step = function(){
		if(!elementVisible) exit;
	
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		hover = point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height);
		step_element()

		
		if(mouse_check_button_released(mb_left) && point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height)){
			//SOUND CLICK
			if(soundClick != undefined){
				if(!audio_is_playing(soundClick)) audio_play_sound(soundClick,1,0)	
			}
			click();
		}			

		
		//SOUND HOVER
		if(soundHover){
			if(hover && !onButton){
				onButton = true
				audio_play_sound(soundHover,1,0)	
			}
			if(!hover) onButton = false
		}
		
		
	}
	
	static step_element = function(){}
	
	
	
	static draw = function(){
		if(!elementVisible) exit;
		if(wrapper) draw_wrapper()
		draw_element()
		draw_end()

		
	};
	static draw_element = function(){}
	
	static draw_wrapper = function(){
		if(hover) wrapperAlpha = .5
		else wrapperAlpha = 1;
		
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,wrapperAlpha);	
	}
	
	static draw_end = function(){
		//if(has_focus() && userInput == "pad") draw_rectangle(x,y,x+width-1,y+height-1,1);
		if(hover && string_length(helpText)){
			draw_set_color(c_white);
			draw_set_font(font_m5);
			draw_text(16,540-32,helpText);
			resetFont();	
		}
	}
	
	static destroy = function(){
	
	
	};
	
	
	

}