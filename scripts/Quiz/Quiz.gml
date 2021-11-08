

function Quiz() constructor{
	timedFunctions = ds_list_create();
	loading = undefined;
	warehousePigs = undefined;
	pigs = ds_list_create();
	pigsWithAnswer = ds_list_create();
	selectedPig = 0;
	king = undefined;
	notaryPig = undefined;
	doorKing = undefined;
	grid = oGrid.grid;
	state = function(){};
	
	questions = undefined;
	currentQuestion = undefined;
	timerQuestions = 30;
	
	pigsToSpan = 4;
	rightAnswers = 0;
	wrongAnswers = 0;
	soundRight = snd_right_answer;
	soundWrong = snd_wrong_answer;

	start();
	static start = function(){
		span_pigs();
		loading = new Loading();
		questions = new Questions();
	
		RESOURCES.set("alivePigs",pigsToSpan)
	
		setTimeout(function(){
			loading.destroy();
			startQuiz();
			audio_stop_all()
			audio_play_sound(choose(snd_bso0,snd_bso1,snd_bso2,snd_bso3),1,1);
		},60);
		
	}
	static startQuiz = function(){
		doorKing = grid.doorList[irandom(array_length(grid.doorList)-1)];	
		king = new NPCKing(doorKing.x,doorKing.y);
		king.enter_room();
		state = waiting;
	}
	
	static quiz_intro = function(){
		
		var startText = ["Bienvenido","Quedan "+string(questions.totalQuestions)+" preguntas para completar la medalla "+global.medalSelected.name]
		king.speak(startText);
		king.state = king.speakingIntro;
	}
	
	static next = function(){
		if(questions.questions_remaining()){
			currentQuestion = new Question( questions.get_question() );
			print("QUESTION",currentQuestion)
			DATA.save_log(currentQuestion)
			if(!check_pigs()) exit;
			king.speak(["Pregunta "+ string( global.medalSelected.value + 1 )+" sobre "+currentQuestion.category]);
			king.state = king.readCategory;
		}else{
			king.speak(["Hemos terminado","Has acertado "+string(rightAnswers)+" preguntas","Has fallado "+string(wrongAnswers)+" preguntas"]);
			king.state = king.speakFinish;
		}
		
	}
	
	static results = function(){
		layer_set_visible("Background",true);
		//RESULTS = new ScorePanel(RESOURCES.diamons,ds_list_size(DATA.warehousePigs),1000,500)
	}
	
	
	static check_pigs = function(){
		//Comprueba si quedan suficientes cerdos para repartir respuestas
		if(currentQuestion.answers_remaining() > ds_list_size(pigs)){
			king.speak(["No hay suficientes cerdos para continuar","Has acertado "+string(rightAnswers)+" preguntas","Has fallado "+string(wrongAnswers)+" preguntas"]);
			king.state = king.speakFinish;
			return false
		}return true;
	}
	
	static get_question = function(){
		king.speak([currentQuestion.title]);
		king.state = king.readQuestion;
	}
	
	static set_answer =  function(){
		state = waiting;
		
		if(currentQuestion.answers_remaining()){
			var randNumber = irandom(ds_list_size(pigs)-1)
			var randPig = pigs[| randNumber];
			ds_list_add(pigsWithAnswer,randPig);
			ds_list_delete(pigs,randNumber);
			
			var textAnswer = currentQuestion.get_answer();
			randPig.alert();
			randPig.answer = textAnswer;
			randPig.state = randPig.listening
			setTimeout(function(){set_answer()},choose(30,45,60))
		}else{
			//Al terminar de repartir respuestas inicia el contador
			//timerQuestions = 30;
			//notaryPig.speak([timerQuestions]);
			//notaryPig.state = notaryPig.counter;
		}
		
		
	}
	
	static check_counter = function(){
		timerQuestions--;
		if(timerQuestions == 0){
			king.speak(["¡Tiempo!","Siguiente pregunta"]);
			king.state = king.speakingIntro;
			notaryPig.speak(["¡Tiempo!"]);
			
		}else{
			setTimeout(function(){
				notaryPig.speak([timerQuestions]);
				notaryPig.state = notaryPig.counter;
			},60)
		}
	}
		
	static check_answer = function(_answer,_pig){
		var kingText = [];
		//Si aun quedan respuestas por repartir exit
		if(ds_list_size(pigsWithAnswer) != currentQuestion.totalOptions) exit;
		
		var isCorrect = currentQuestion.check_answer(_answer);
		var pig = _pig;
		
		if(isCorrect){
			var heart = new Heart(king.x,king.y-32,pig.x,pig.y-20);
			pig.add_lives();
			rightAnswers++;
			DATA.userData[? "Diamons"] += 10;
			RESOURCES.set("diamons",DATA.userData[? "Diamons"]);
						
			audio_play_sound(soundRight,1,false);
			array_push(kingText,choose("Muy bien "+pig.name,"Cerdo listo"));
		}
		else{
			pig.sub_lives()
			wrongAnswers++;
			audio_play_sound(soundWrong,1,false);
			layer_set_visible("wrong",true);
			setTimeout(function(){layer_set_visible("wrong",false);},10)
			array_push(kingText,"No es correcto", "La respuesta correcta es",currentQuestion.options[0]);	
		}
		
		if(pig.live <= 0) ds_list_delete(pigsWithAnswer,ds_list_find_index(pigsWithAnswer,pig));
		//Devuelvo pigsWithAnswer a lista de pigs
		for(var i = 0; i < ds_list_size(pigsWithAnswer); i++){
			ds_list_add(pigs,pigsWithAnswer[| i]);	
		}
		ds_list_clear(pigsWithAnswer);
				
		with(oNpcPig){
			npc.showAlert = false;
			npc.answer = "";
			npc.remove_focus();
		}
		
		//UPDATE GUI
	
		RESOURCES.set("alivePigs",ds_list_size(pigs))
		RESOURCES.set("deadPigs",pigsToSpan - ds_list_size(pigs))
		MEDAL.add_value();
		
		//STATS
		DATA.update_stats(currentQuestion)
		DATA.save()
		
		king.speak(kingText);
		king.state = king.speakingResult;

	}
	
	#region STATES
	static waiting = function(){
	
		#region Seleccion Pig con RIGH/LEFT
			if (keyboard_check_pressed(vk_right)) selectedPig--;
			else if(keyboard_check_pressed(vk_left)) selectedPig++;	
			if(keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_left)){
				if(selectedPig > ds_list_size(pigsWithAnswer)-1) selectedPig = 0;
				else if(selectedPig < 0 ) selectedPig = ds_list_size(pigsWithAnswer)-1;
				selectedPig = clamp(selectedPig,0,ds_list_size(pigsWithAnswer)-1);
				if(ds_list_size(pigsWithAnswer)){
					with(oNpcPig) npc.remove_focus();
					pigsWithAnswer[| selectedPig].set_focus();
				}
			}
		#endregion
		
	
	
	}
	#endregion
	
	//STEP QUIZ
	static step = function(){
		doTimedFunctions();
		state();
		
		
		//TODO REVISAR DEBUG
		if(keyboard_check_pressed(vk_f3)){
			for(var k = 0; k < ds_list_size(questions.questionsByCategory);k++){
				print(questions.questionsByCategory[| k])
			}
			print("CurrentQuestion",currentQuestion)
		}
	}
	
	//SPAN PIGS
	static span_pigs = function(){
		warehousePigs = DATA.warehousePigs;
		
		var list = ds_list_create()
		ds_list_copy(list,warehousePigs)
		
		var toSpan = pigsToSpan
		while(toSpan){
			var nRandPig = irandom(ds_list_size(list)-1)
			var randomPig = list[| nRandPig]
			var flor = grid.get_free_position();
			var pig = new NPCPig(flor.x,flor.y,randomPig.name,randomPig.live,randomPig.rightAnswers,randomPig.wrongAnswers);
			ds_list_delete(list,ds_list_find_index(list,randomPig))
			ds_list_add(pigs,pig);
			toSpan--;
		}
		ds_list_destroy(list);
		
	}
	
	//DOTIMEDFUNCTIONS
	static doTimedFunctions = function(){
		var funcs = timedFunctions;
		for(var i = ds_list_size(funcs) - 1; i >= 0; i--){
			var func = funcs[| i];
			if(func.timer > 0){
				func.timer--;
				if(func.timer == 0){
					func.func();
					delete func;
					ds_list_delete(funcs,i)
				}
			}
		}
	}

	//SETTIMEDOUT
	static setTimeout = function(_func,_timeout){
		var timedFunc = new TimedQuizFunction(_func,_timeout);
		ds_list_add(timedFunctions,timedFunc);
		return timedFunc;
	}

	//DESTROY QUIZ
	static destroy = function(){
		print("destroy quiz")
		if(questions) questions.destroy();
		ds_list_destroy(pigs);
		if(currentQuestion) currentQuestion.destroy();
	}
	
	
	//DRAW
	static draw = function(){
		if(global.debug){
			
		}
			
	}
	
	
}//END CLASS





//TIMED QUIZ CLASS
function TimedQuizFunction(_func,_timeout) constructor{
	func = _func;
	timer = _timeout;
}