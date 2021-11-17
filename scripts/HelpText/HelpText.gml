
function HelpText(_x,_y,_width = 100,_value = "Text"):GUI(200) constructor{
	name = "HelpText";
	speed = 20
	x = _x
	y = -200
	endPosition = [x,36]
	wrapper = spr_wrapper_14
	open = false
	width = _width;
	
	value = _value
	padding = 5;
	
	text = new SimpleText(x+padding+5,y+padding,value,width-5-padding*2,global.color_black,font_m5,fa_left,fa_top,14)
	height = text.get_height() + padding * 2.5
	helpTextWrapper = new Wrapper(x+padding,y+padding,width-padding*2,height-padding*2,spr_wrapper_18)
	
	elements = [helpTextWrapper,text]
	create()

}