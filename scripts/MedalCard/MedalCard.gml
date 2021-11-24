function MedalCard(_x,_y,_medalData):GUI() constructor{
	name = "MedalCard";
	x = _x;
	y = _y;
	width = 100
	height = 100;
	wrapper = spr_wrapper_14;
	medal = _medalData;
	
	
	medalName = new SimpleText(x+(width/2), y+18, medal.name,90,c_white,global.font_classic,fa_center,fa_middle,12)
	medalWrap = new StaticSprite(x,y,spr_medals,1,medal.name)
	medalWrap.x = x + (width/2)
	medalWrap.y = y + (height/2)
	bar = new LargeProgressBar(x,y+height - 20,90,16,medal.value,"Progress",medal.total,global.color_red,c_white,true)
	bar.x = x + (width/2) - (bar.width/2)
	elements =[medalName,medalWrap,bar];
	
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
			
			with(oControllerRoom){
				if(control.name == "MedalController"){
					control.pig.speak([
						"Medalla " + other.medal.name+
						" \n"+
						other.medal.description+
						" \nHas completado "+
						string(other.medal.value)+
						" de "+
						string(other.medal.total)
					])
					
				}
				
			}
			
			
			print(medal)
		}
	
	}



}