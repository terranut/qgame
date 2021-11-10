
function NPCKing(_x,_y):NPC() constructor{
	
	name = "Eustace III";
	sprites = {run: spr_king_run,idle: spr_king_idle};
	speakSound = snd_speak5
	
	x = _x;
	y = _y;
	
	create();
	static create = function(){
		instance = instance_create_depth(x,y,100,oNpcKing);
		instance.visible = false;
		instance.npc = self;
		state = waiting;
	}
	static remove_focus = function(){ 
		focus = false;
		if(talker) talker.show = false
	}
	static set_focus = function(){
		with(oNpc) npc.remove_focus();
		focus = true;
		if(talker) talker.show = true
	}
	static draw_frame = function(){
		imageIndexFrame = imageIndexFrame + (sprite_get_speed(spr_alert)/100)*2;
		if(focus) draw_sprite_ext(spriteFrame,imageIndexFrame, x-28, y-35, 1.6,1.4,0,c_white,1 );
	}
	
	
	#region ESTADOS
		static waiting = function(){};
	
		//al terminar la intro pide al quiz la primera pregunta
		static speakingIntro = function(){
			if(talker.finish){
				state = waiting;
				QUIZ.next();
			}
		}
	
		static speakFinish = function(){
			if(talker.finish){
				state = waiting;
				QUIZ.results();
			}
		}
		
		static speakingResult = function(){
			if(talker.finish){
				state = waiting;
				QUIZ.quiz.next();
			}
		}
	
		//al terminal de leer pregunta pide las respuestas
		static readQuestion = function(){
			if(!talker.writing){
				state = waiting;
				QUIZ.set_answer();
			}
		
		}
	
		static readCategory = function(){
			if(talker.finish){
				state = waiting;
				QUIZ.get_question();
			}
		
		}
	
		static entering = function(){
			if(layer_sequence_is_finished(currentSequence)){
				instance.visible = true;
				layer_sequence_destroy(currentSequence);
				state = waiting;
				QUIZ.quiz_intro()
			}else instance.visible = false;
		}

	#endregion
	
	static enter_room = function(){
		currentSequence = layer_sequence_create("Sequences",x,y,sq_kingEnterRoom);
		layer_sequence_play(currentSequence);
		state = entering;
	}
	

}//END CLASS
