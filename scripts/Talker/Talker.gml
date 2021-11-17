
function Talker(_array,_speakSound,_speakSpeed = 0.25) constructor{
	array = _array;
	queue = undefined;
	xOffset = 10;
	yOffset = -20;
	sprite = spr_ballon_text_left;
	spriteW = sprite_get_width(sprite);
	spriteH = sprite_get_height(sprite)
	char_speed = _speakSpeed;
	width = 200;
	height = 10;
	text = "";
	border = 6;
	speakSound = _speakSound;
	char_current = 1;
	x = other.x + xOffset;
	y =  other.y + yOffset;
	show = true;
	fullText = "";
	writing = false;
	finish = false;
	
	create();
	static create = function(){
		queue = arrayToQueue(array)
		fullText = string(ds_queue_dequeue(queue));
		if(string_length(fullText) < 30) text = fullText;
		else text = string_wrap(fullText,width-10);
		
		if(!speakSound) exit;
		audio_play_sound(speakSound,1,false);
	}
	

	
	static step = function(){
		if(!show) exit;
		x = other.x + xOffset;
		y = other.y -  height - 20  ;
		
		var _len = string_length(text);
		if (char_current < _len){
			if(keyboard_check_pressed(vk_space)) char_current = _len;
			writing = true;	
			char_current += char_speed;
			//AUDIO POR CADA LETRA
			if(!speakSound) exit;
			if(audio_is_playing(speakSound)) exit;
			
			audio_sound_pitch(speakSound, choose(1.2,1.3,1.4,1.5,1.8,1.9))
			audio_play_sound(speakSound,1,false);
			
		}else{
			writing = false;
			if(keyboard_check_pressed(vk_space)){
				if(ds_queue_size(queue)){
					char_current = 0;
					fullText = string(ds_queue_dequeue(queue));
					if(string_length(fullText) < 50) text = fullText;
					else text = string_wrap(fullText,width-10);
				}else finish = true;
			}

		}
		
		
		
	}
	
	static set_speed = function(_value = 0.25){
		char_speed = _value
	}
	
	static draw = function(){
			draw_set_font(global.font_talker);
			draw_set_color(global.color_black);

			var _str = string_copy(text, 1, char_current);

			//DRAW WRAPPER
			var newW = string_width(_str) + border*2
			height = string_height(_str) + (border*2) + 3;
			var xscale = (newW)/spriteW;
			var yscale = height/spriteH;
			if(show) draw_sprite_ext(sprite,0,x-border,y-border,xscale,yscale,0,c_white,1)

			//DRAW TEXT
			
			//var lastChar = string_copy(_str,string_length(_str)-1,1)
			
			if(show) draw_text(x, y,  _str);

			resetFont();
			
		
	}
	
	static destroy = function(){
		//print("destroy talker")
		if(queue) ds_queue_destroy(queue)
	};
	

}