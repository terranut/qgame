
function Loading():GUI() constructor{
	name = "Loading";
	width = 200;
	height = 32;
	x = (room_width/2) - width/2;
	y = 16
	
	
	background = new WrapperRectangle(0,0,960,540,c_black)
	label = new LabelText(x,y,"loading",12);
	label.x = x + (width/2) -  label.width/2;
	label.y = 540/2
	elements = [background,label]
	create()
		
}