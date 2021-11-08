
function Wrapper(_x,_y,_width,_height,_wrapper = spr_wrapper_1,_alpha = 1):GUIElement() constructor{
	width = _width;
	height = _height;
	x = _x;
	y = _y;
	wrapper = _wrapper
	alpha = _alpha;
	
	static click = function(){};
	
	static draw = function(){
		
		//WRAPPER
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,alpha);
	
	
	}
	
}