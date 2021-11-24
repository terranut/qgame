
function NPCAssistantPig(_x,_y,_name = "Assistant",_xscale = 1):NPC() constructor{
	x = _x;
	y = _y;
	name = _name;
	sprites = {run: spr_pig_run,idle: spr_pig_idle};
	answer = "";
	speakSound= snd_speak0;
	speakSpeed = 1;
	xscale = _xscale;
	
	create();
	static create = function(){
		instance = instance_create_depth(x,y,9,oNpcPig);
		instance.npc = self;
		instance.image_xscale = xscale;
		instance.image_speed = choose(.8,.9,1);
		state = waiting;
	}
	
	static set_focus = function(){
		audio_play_sound(snd_select_pig,1,false);
		silence();
		speak([randomPhrase("medal")])
	}

	static remove_focus = function(){ 
		focus = false;
		if(talker){
			talker.destroy();
			talker = undefined;
		}
	}

	
	#region ESTADOS
	
	static waiting = function(){};
	

	
	
	static counter = function(){
		if(!talker.writing){
			state = waiting;
			QUIZ.check_counter();
		}
	};
	
	#endregion
	
	
	
	
	static animation_end = function(){}
	
	
}