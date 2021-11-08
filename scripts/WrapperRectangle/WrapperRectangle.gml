
function WrapperRectangle(_x,_y,_width = 100,_height = 100,_color = c_black,_alpha = 1):GUIElement() constructor{
	x = _x;
	y = _y;
	alpha = _alpha;
	color = _color;
	width = _width;
	height = _height;
	
	static click = function(){}
	
	static draw = function(){
		draw_set_color(color);
		draw_set_alpha(alpha);
		draw_rectangle(x,y,x+width,y+height,0)
		draw_set_alpha(1);
		resetFont();
	}

}