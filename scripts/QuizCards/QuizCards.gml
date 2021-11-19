
function QuizCard(_spr,_title,_value,_width = 100,_live = 0 ):GUI() constructor{
	name = "QuizCard";
	spr = _spr;
	title = _title;
	value = _value;
	live = _live;
	width = _width
	height = 70;
	wrapper = spr_wrapper_14;
	speed = 10
	x = room_width - width - 32 
	y = -200
	hover = false;
	
	focus = false;
	
	#region CONSTRUCTOR
		var exists = false;
		with(oGuiController){
			if(gui.name == "QuizCard")
				if(gui.title == other.title){
					exists = true;
					with(oGuiController) if(gui.name == "QuizCard") gui.focus = false
					gui.focus = true;
				}
		}
	
		if(exists) exit;
	
		with(oGuiController) if(gui.name == "QuizCard") gui.focus = false
		focus = true;
		
		text = new TextExt(x+5,y+35,width-10,value)
		var yy = 40;
		with(oGuiController){
			if(gui.name == "QuizCard") yy += gui.height + 10
		}
		
		endPosition = [ room_width - width - 32 , yy ]
		sprElement = new StaticSprite(x+15,y+20,spr,0);
		titleElement = new Text(x+30,y+15,title,c_white,global.font_classic,fa_left,fa_middle);
		
		button = new IconButton(x+ width-18,y+3,4,"Seleccionar respuesta",function(){select()})
		heartBar = new HeartBar(x+32,y+28,live)
		warningLive = new StaticSprite(x+width-18-5,y+10,spr_alert_static,0,"Si falla, este cerdo morirá")
		
		elements = [sprElement,titleElement,text]
		if(title != "Eustace III"){
			array_push(elements,button,heartBar)
			if(live <= 2) array_push(elements,warningLive)
		}
		
		
		create();
	#endregion
	
	static select = function(){
		with(oNpcPig) if(npc.name == other.title) npc.check_answer()
	}
	
		
	static extra_step = function(){
		if(text){
			wrapperGui.height = text.get_height() + 42
			height = text.get_height() + 38
		}
		
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		if(point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height)) 	hover = true;
		else hover = false
		
		if (focus) wrapperGui.wrapper = spr_wrapper_16
		else wrapperGui.wrapper = spr_wrapper_14
		
		if(hover && mouse_check_button_pressed(mb_left)){
			with(oNpc) if(npc.name == other.title) npc.set_focus()
			with(oGuiController) if(gui.name == "QuizCard") gui.focus = false
			focus = true;
		}
		
		
					
	
	}
		
	static alarm_0 = function(){
		destroy();
	}
			
	

}