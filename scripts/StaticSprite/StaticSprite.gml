
function StaticSprite(_x,_y,_spr,_subSpr = 0):GUIElement() constructor{
	x = _x;
	y = _y;
	sprite = _spr;
	subImage = _subSpr
	width = sprite_get_width(sprite)

	static click = function(){}
	
	static draw_element = function(){
		var xOff = sprite_get_xoffset(sprite);
		var yOff = sprite_get_yoffset(sprite);
		sprite_set_offset(sprite,sprite_get_width(sprite)/2,sprite_get_height(sprite)/2);
		draw_sprite(sprite,subImage,x,y);
		sprite_set_offset(sprite,xOff,yOff);
	}
	
	
}
