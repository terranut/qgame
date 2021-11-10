
function WrapperSprite(_x,_y,_sprite,_width = 64, _height = 64,_wrapper = spr_wrapper_6,_subImage = 0):GUIElement() constructor{
	
	type = "WrapperSprite";
	x = _x;
	y = _y;
	width = _width;
	height = _height;
	spr = _sprite;
	wrapper = _wrapper;
	subImage = _subImage;
	
	static draw_element = function(){
		var wrapperW = sprite_get_width(wrapper);
		var wrapperH = sprite_get_height(wrapper);
		draw_sprite_ext(wrapper,0,x,y,width/wrapperW,height/wrapperH,0,c_white,1);
		var xOff = sprite_get_xoffset(spr);
		var yOff = sprite_get_yoffset(spr);
		sprite_set_offset(spr,sprite_get_width(spr)/2,sprite_get_height(spr)/2);
		draw_sprite_ext(spr,subImage,x-2+width/2,y-2+height/2,1,1,0,c_white,1);
		sprite_set_offset(spr,xOff,yOff);
	}

}