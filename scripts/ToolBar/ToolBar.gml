
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
	
	diamons = new WrapperCountSprite(x+10, y+5,spr_diamon,"Diamantes",1000,"Gana más diamantes acertando preguntas. Puedes gastar tus diamantes para comprar más cerdos.")
	alivePigs = new WrapperCountSprite(x+ 10 + diamons.get_width() + 12, y+5,spr_pig_static,"Cerdos",10,"Cerdos vivos en esta ronda.")
	deadPigs = new WrapperCountSprite(x + diamons.get_width() + alivePigs.get_width() + 32 , y+5,spr_skull,"Cerdos muertos",4,"Cerdos muertos en esta ronda. Cerdo muerto, cerdo perdido.")
	
	
	questions = new WrapperCountSimple(x+500,y+5,spr_done_icon,0)
	scoreRight = new WrapperProgress(x+600,y+5,spr_done_icon,50,"Preguntas acertadas en esta medalla",global.color_green)
	scoreWrong = new WrapperProgress(x+720,y+5,spr_close_icon,13,"Preguntas falladas en esta medalla")
	
	watch = new Timer(x+850,y+5)
	elements = [back,diamons,alivePigs,deadPigs,questions,scoreRight,scoreWrong,watch]
	create()
	
	static set_timer = function(_value){
		print("SET TIMER",_value)
		watch.timerStep = room_speed* _value
		watch.timer = 1000000* _value
		watch.stopped = !(_value > 0)
	}
	
	
	
	
	
}