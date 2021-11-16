
function ToolBar():GUI() constructor{
	name = "ToolBar";
	speed = 2
	width = room_width;
	height = 34;
	x = 0
	y = -34
	wrapper = undefined
	open = false

	initY = y;
	endX = 0;
	endY = 0;
	
	var colorBack = make_color_rgb(33,30,43)
	back = new WrapperRectangle(x,y,width,height,colorBack)
	
	diamons = new WrapperCountSprite(x+10, y+5,spr_diamon,"Diamons",1000)
	alivePigs = new WrapperCountSprite(x+ 10 + diamons.get_width() + 12, y+5,spr_pig_static,"Pigs",10)
	deadPigs = new WrapperCountSprite(x + diamons.get_width() + alivePigs.get_width() + 32 , y+5,spr_skull,"Dead pigs",4)
	

	
	elements = [back,diamons,alivePigs,deadPigs]
	create()
	
	
}