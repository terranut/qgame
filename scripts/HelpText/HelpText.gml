
function HelpText(_x,_y,_width = 100):GUI() constructor{
	name = "HelpText";
	speed = 10
	x = _x
	y = -100
	wrapper = spr_wrapper_15
	open = false
	
	width = _width;
	height = 50
	

	initX = x;
	initY = -50;
	endX = 0;
	endY = 34
	
	helpText = new WrapperText(x,y,"Texto de varias lineas como expicacion. Si puedes comprar con el sufi dinero puedes adquirir mas pig en sudanl paritda",spr_wrapper_15)
	
	
	elements = []
	create()
	

}