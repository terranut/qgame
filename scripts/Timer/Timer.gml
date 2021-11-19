
function Timer(_x,_y,_secconds = 0):GUIElement() constructor{
	x = _x;
	y = _y;
	width = 50;
	height = 25;
	wrapper = spr_wrapper_15
	secconds = _secconds;
	timerStep = room_speed * secconds
	timer = 1000000 * secconds
	font = global.font_gold
	color = c_white;
	stopped = true;
	
		
	static draw_element = function(){
		draw_sprite(spr_watch,0,x+10, y+height/2)
		draw_set_font(font)
		draw_set_halign(fa_right)
		draw_set_valign(fa_middle)
		
		var time = ceil(timer/1000000)
		var text = "";
		if(time < 10) text = "0"+string(time)
		else text = string(time)
		
		if(time <= 5 && time > 0) draw_set_color(global.color_red)
		else draw_set_color(color)
		
		draw_text(x+15+width/2,y+height/2,text);
		resetFont()
		
	}
	
	
	static step_element = function(){
		if(stopped) exit;
		
		if(timer > 0) timer -= delta_time;
		else stopped = true
		
		if(timerStep > 0) timerStep--;
		
		if(ceil(timerStep/room_speed) > 5){
			if((timerStep/room_speed) mod 1 == 0) audio_play_sound(snd_timer,9,false)
		}
		else{
			if((timerStep/room_speed) mod .5 == 0) audio_play_sound(snd_timer,9,false)
		}
		
	}
	
	
	
	
	
	
}