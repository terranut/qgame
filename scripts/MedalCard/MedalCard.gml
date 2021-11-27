function MedalCard(_x,_y,_medalData):GUI() constructor{
	name = "MedalCard";
	x = _x;
	y = _y;
	width = 90
	height = 90;
	wrapper = spr_wrapper_14;
	medal = _medalData;
	speak = [];
	
	
	
	medalName = new SimpleText(x+(width/2), y+18, medal.name,90,c_white,global.font_classic,fa_center,fa_middle,12)
	medalSpr = new StaticSprite(x+(width/2),y+(height/2),spr_crown_small,0)
	bar = new LargeProgressBar(x,y+height - 20,70,16,medal.value,"Progress",medal.total,global.color_red,c_white,true)
	bar.x = x + (width/2) - (bar.width/2)
	elements =[medalName,medalSpr,bar];
	
	create();


	static extra_step = function(){
		
		var mouseX = device_mouse_x_to_gui(0)
		var mouseY = device_mouse_y_to_gui(0)
		if(point_in_rectangle(mouseX,mouseY,x,y,x+width,y+height)) 	hover = true;
		else hover = false
		
		if (focus) wrapperGui.wrapper = spr_wrapper_16
		else wrapperGui.wrapper = spr_wrapper_14
		
		if(hover && mouse_check_button_pressed(mb_left)){
			with(oGuiController) if(gui.name == "MedalCard") gui.focus = false
			focus = true;
			global.medalSelected = medal;
			
			if(medal.locked == 1) speak = ["Aún no has desbloqueado esta medalla"]
			else{
				if(medal.value == medal.total) speak = ["Ya has completado esta medalla"];
				else speak = ["Medalla " + medal.name+" \n"+medal.description+" \nHas completado "+string(medal.value)+" de "+string(medal.total)]	
			}
			
			with(oControllerRoom) if(control.name == "MedalController") control.pig.speak(other.speak)
			print(medal)
		}
	
	}



}