
function Notification(_title = "MEDALLA OBTENIDA",_msg = "Has completado la medalla bronze"):GUI() constructor{
	name = "Notification";
	width = 80;
	height = 65;
	wrapper = spr_wrapper_16;
	speed = 20;
	
	x = -200
	y = room_height - height -16
	initX = x;
	initY = y;
	endX = 16
	endY = room_height - height -16
	
	
	titleText = _title;
	msgText = _msg;
	
	draw_set_font(global.font_gold)
	width = string_width(titleText) +20
	resetFont()
	
	titleElement = new Text(x+8,y + 12,titleText,c_white,global.font_classic_margin,fa_left,fa_middle)
	msgElement = new SimpleText(x+12,y+24,msgText,width-20,c_white,font_m5,fa_left,fa_top,12)
	wrapperText = new Wrapper(x+6,y+22,width-12,msgElement.get_height()+5,spr_wrapper_17)
	height = 10 + titleElement.height + msgElement.get_height() +13
	
	elements = [titleElement,wrapperText,msgElement]
	create();
	
	with(oGuiController){
		if(gui.name == "Notification") alarm[0] = 180	
	}
	
		
	static alarm_0 = function(){
		open = false
		alarm_0 = function(){instance_destroy(instance)}

		with(oGuiController){
			if(gui.name == "Notification") alarm[0] = 120	
		}
	}
	

}