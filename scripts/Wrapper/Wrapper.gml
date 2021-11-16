
function Wrapper(_x,_y,_width,_height,_wrapper = spr_wrapper_1,_alpha = 1):GUIElement() constructor{
	name = "Wrapper"
	width = _width;
	height = _height;
	x = _x;
	y = _y;
	wrapper = _wrapper
	alpha = _alpha;
	
	holdClick = false;
	
	//static click = function(){};
	
	static draw_element = function(){
		
		//WRAPPER
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,alpha);
	
	
	}
	
	static step_element = function(){
		
		
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		hover = point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height);
		if(mouse_check_button_pressed(mb_left) && point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height)){
			click();
		}
		
		if(mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x,mouse_y,x,y,x+width,y+20)){
			holdClick = true;
		}
		if(mouse_check_button_released(mb_left)) holdClick = false;
		
		
		
		if(has_focus() && holdClick && other.gui.dragable){
			//x = mouse_x;
			//y = mouse_y;
			other.x = mouse_x;
			other.y = mouse_y;
		}
		
		
		
	}
	
}