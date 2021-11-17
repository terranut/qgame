
function PigAnswer(_pig = {name:"Evelin",answer:"repueta muy larga"} ):GUI() constructor{
	name = "PigAnswer";
	pig = _pig
	answer = pig.answer;
	width = 90;
	height = 70;
	wrapper = spr_wrapper_14;
	speed = 25
	x = room_width - width - 32 
	y = -200
	hover = false;
	text = undefined;
	
	#region CONSTRUCTOR
		var exists = false;
		with(oGuiController){
			if(gui.name == "PigAnswer")
				if(gui.pig.name == other.pig.name) exists = true;
		}
	
		if(exists) exit;
	
		text = new TextExt(x+5,y+30,width-10,pig.answer)
		var yy = 50;
		with(oGuiController){
			if(gui.name == "PigAnswer") yy += 75
		}
		
		endPosition = [ room_width - width - 32 , yy ]
		pigSpr = new StaticSprite(x+15,y+15,spr_pig_static,0);
		pigName = new Text(x+30,y+15,pig.name,c_white,global.font_classic,fa_left,fa_middle);
		
		elements = [pigSpr,pigName,text]
		create();
	#endregion
	
		
	static extra_step = function(){
		if(text) wrapperGui.height = text.get_height() + 38
		
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		if(point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height)){
			hover = true;
			wrapperGui.alpha = 1
		}else{
			hover = false;
			wrapperGui.alpha = .8
		}
		
		if(hover && mouse_check_button_pressed(mb_left)){
			with(oNpcPig) if(npc.name == other.pig.name) npc.set_focus()
		}
	
	}
		
	static alarm_0 = function(){
		destroy();
	}
			
	

}