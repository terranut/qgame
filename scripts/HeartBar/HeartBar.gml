
function HeartBar(_x,_y,_value = 5):GUIElement() constructor{
	x = _x;
	y = _y;
	value = _value;
	
	static click = function(){};
	
	static draw_element = function(){
		var xx = x;
		for(var i = value; i > 0; i--){
			draw_sprite(spr_heart_mini,0,xx,y)	
			xx += 11;
		}
	
	}

}