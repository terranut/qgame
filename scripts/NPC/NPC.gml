
function NPC(){
	
	name = "Default NPC";
	focus = false;
	spriteFrame = spr_select_frame;
	currentSequence = undefined;
	talker = undefined;
	showAlert = false;
	alertSound = snd_alert;
	speakSpeed = 0.25;
	
	
	infoWindow = undefined;
	instance = undefined;
	sprites = {run: undefined,idle: undefined}

	static set_focus = function(){focus = true;}
	static remove_focus = function(){ focus = false;}
	
	
	//DRAW NPC
	static draw = function(){
		//draw_set_color(c_red)
		//draw_text(x-16,y+16,string(x)+" "+string(y))
		//resetFont()
		
		if(showAlert) draw_sprite(spr_alert,instance.image_index,x,y-sprite_get_height(instance.sprite_index)-5)
		draw_sprite_ext(instance.sprite_index,instance.image_index,instance.x,instance.y,instance.image_xscale,1,0,c_white,1);
		draw_frame();
		draw_talker()
	}
	
	static draw_talker = function(){
		if(talker) talker.draw();
	}
	
	imageIndexFrame = 0
	static draw_frame = function(){
		imageIndexFrame = imageIndexFrame + (sprite_get_speed(spr_alert)/100)*2;
		if(focus) draw_sprite_ext(spriteFrame,imageIndexFrame, x-23, y-30, 1.4,1.4,0,c_white,1 );
	}
	
	//ENABLE ALERT SOBRE LA CABEZA DEL NPC
	static alert = function(){
		showAlert = !showAlert;	
		if(showAlert){
			audio_play_sound(alertSound,1,false);
		}
	}
	
	static state = function(){}
	
	//STEP NPC
	static step = function(){
		
		state();
		x = instance.x;
		y = instance.y;
		var mouseX =  mouse_x 
		var mouseY =  mouse_y 
	
	
		//CONTROL FOCUS
		var sprW = sprite_get_width(instance.sprite_index);
		var sprH = sprite_get_height(instance.sprite_index);
		if(mouse_check_button_released(mb_left) && point_in_rectangle(mouseX,mouseY,x-(sprW/2),y-sprH,x+(sprW/2),y)){
			if(focus) exit;
			set_focus();
		}
		
		//TALKER
		if(talker) talker.step();
		
	}
	
	#region STATES
		
	static move = function(){
		if(focus){
			if(keyboard_check(vk_right)){
				instance.sprite_index = sprites.run
				instance.image_xscale = -1;
				instance.x = instance.x + 1	
			}else if(keyboard_check(vk_left)){
				instance.sprite_index = sprites.run;
				instance.image_xscale = 1;
				instance.x = instance.x - 1	
			}else{
				instance.sprite_index = sprites.idle;
			}
		}
		
	
	}
	
	#endregion
	
	static speak = function(_value){
		if(talker){
			talker.destroy();
			talker = undefined;
		}
		talker = new Talker(_value,speakSound,speakSpeed)
		
		
	}
	
	static silence = function(){
		if(talker){
			talker.destroy();
			talker = undefined;
		}
	}
	
	//DESTROY NPC
	static destroy = function(){
		print("destroy",name);
		if(infoWindow) infoWindow.destroy();
		instance_destroy(instance);
	}
	static animation_end = function(){}
	
	
}//END CLASS