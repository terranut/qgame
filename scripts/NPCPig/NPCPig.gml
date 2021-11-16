
function NPCPig(_x,_y,_name = randName(),_live = 1,_correct = 0, _wrong = 0):NPC() constructor{
	x = _x;
	y = _y;
	name = _name;
	live = _live;
	correct = _correct;
	wrong = _wrong;
	sprites = {run: spr_pig_run,idle: spr_pig_idle};
	infoWindow = undefined;
	answer = "";
	speakSound = choose(snd_speak0,snd_speak1,snd_speak2,snd_speak3,snd_speak4,snd_speak5)

	create();
	static create = function(){
		instance = instance_create_depth(x,y,100,oNpcPig);
		instance.npc = self;
		instance.image_xscale = choose(1,-1);
		instance.image_yscale = 1;
		instance.image_speed = choose(.8,.9,1);
		state = waiting;
	}
	
	static set_focus = function(){
		audio_play_sound(snd_select_pig,1,false);
		
		with(oNpc) npc.remove_focus();
		focus = true;
		if(live <= 0) infoWindow = new PigInfo(x,y,name,live,correct,wrong,spr_skull);
		else infoWindow = new PigInfo(x,y,name,live,correct,wrong,spr_pig_idle);
		//print(self)
	}

	static remove_focus = function(){ 
		focus = false;
		if(talker){
			talker.destroy();
			talker = undefined;
		}
		if(infoWindow){
			infoWindow.destroy();
			infoWindow = undefined;
		}
	}

	
	
	#region ESTADOS
	
	static waiting = function(){};
	static dead = function(){
	};
	
	static listening = function(){
		if(keyboard_check_released(vk_space) && focus && string_length(answer) ){
			if(talker.finish) QUIZ.check_answer(answer,self);
		}
		if(string_length(answer) && focus && talker == undefined) speak([answer]);		
	}
	
	static killing = function(){
		if(layer_sequence_is_finished(currentSequence)){
			instance.sprite_index = spr_skull;
			instance.image_xscale = 1;
			instance.visible = true;
			state = dead;
			layer_sequence_destroy(currentSequence);
		}else{
			instance.visible = false;	
		}
		
	}
	
	static taking_life = function(){
		if(layer_sequence_is_finished(currentSequence)){
			instance.visible = true;
			//choose(function(){}, speak([pigJoy()]))
			state = waiting
			layer_sequence_destroy(currentSequence);
		}else{
			instance.visible = false;	
		}
	}
	
	
	
	static waiting_life = function(){
		if(instance_exists(oItem)){
			if(point_distance(instance.x,instance.y,oItem.x,oItem.y) < 50){
				currentSequence = layer_sequence_create("Sequences",x,y,sq_pigWin);
				layer_sequence_play(currentSequence);
				state = taking_life;
			}
				
		}
		
	}

	#endregion
	
	static kill = function(){
	
		currentSequence = layer_sequence_create("Sequences",x,y,sq_pigDead);
		layer_sequence_play(currentSequence);
		state = killing;
	}
	
	static animation_end = function(){}
	
	
	static add_lives = function(){
		state = waiting_life;
		live++;
		correct++;
		live = clamp(live,0,5);
		infoWindow.setLive(live);
		infoWindow.setRight(correct);
		DATA.update_pig(self)
	}
	
	static sub_lives = function(){
		live -= 2;
		live = clamp(live,0,5);
		wrong++;
		infoWindow.setLive(live);
		infoWindow.setWrong(wrong);
		DATA.update_pig(self)
		if(live <= 0 ) kill();
		
	}

}