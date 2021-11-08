

function Questions() constructor{
	
	totalQuestions = 0;
	categories = undefined;
	categoriesToInclude = [];
	queueQuiz = ds_queue_create();
	questionsByCategory = ds_list_create();
	medal = undefined
	
	
	selection = [];
	
	#region CONSTRUCTOR
		print("medal selected", global.medalSelected);
		categories = readJson("categories" + ".json");	
		medal = global.medalSelected;
		
		if(medal) build_medal();
		else build_classic();
		
		
	#endregion
	
	static build_medal = function(){
		print("BUILD MEDAL",medal)
		totalQuestions = medal.total - medal.value;
		var count = totalQuestions;
		print("start while")
		while(count){
			var question = random_question(medal.categories)
			if(!check_new_question(question.id)){
				if(add_selection(question)) count--;
			}
		}
		print("finish while")
		configure_selection();
	}
	
	
	static random_question = function(_categoriesToInclude){
		var randCat = irandom(array_length(_categoriesToInclude)-1);
		var questions = readJson(string(_categoriesToInclude[randCat]) + ".json");
		var randQuestion = irandom(categories[_categoriesToInclude[randCat]].total)-1;
		var question = questions[randQuestion];
		return question;
	}
	
	static add_selection = function(_question){
		if(!array_length(selection)){
			array_push(selection,_question);
			return true;			
		}else{
			var next = false;
			for(var i = 0; i < array_length(selection); i++){
				if(selection[i].id == _question.id){
					next = true;
					break;
				}
			}
			if(!next){
				array_push(selection,_question);
				return true;
			}else return false
			
		}
		
	}
	
	static configure_selection = function(){
		
		for(var i = 0; i < array_length(selection); i++){
			selection[i].options = splitString(selection[i].options,",");
		}
		
		var listShufle = ds_list_create();
		for(var i = 0; i < array_length(selection);i++){
			ds_list_add(listShufle,selection[i]);
		}
		ds_list_shuffle(listShufle);
		
		//Crea array contador de categorias que han caido
		for(var i = 0; i < array_length(categories);i++){
			ds_list_add(questionsByCategory,{id:categories[i].id, total:0,name:categories[i].name})
		}
		
		//Crea queue, setea la categoria a la pregunta, hace recuento de las categorias que han salido.
		for(var i = 0; i < ds_list_size(listShufle); i++) {
			var category = find_category(listShufle[|i].id);
			listShufle[|i].category = category;
			for(var k = 0; k < ds_list_size(questionsByCategory);k++){
				if(questionsByCategory[| k].name == category) questionsByCategory[| k].total++; 
			}
			
			ds_queue_enqueue(queueQuiz,listShufle[|i])
		}
		ds_list_destroy(listShufle)
	
	}
	
	static build_classic = function(){
		
		print("CLASSIC");
		totalQuestions = 100 ;
		categoriesToInclude = [0,1,2,3,4,5,6,7];
		
		categories = readJson("categories" + ".json");	
		
		var selection = [];
		var count = totalQuestions;
		while(count){
			
			var randCat = irandom(array_length(categoriesToInclude)-1);
			if(randCat < 0) randCat = 0;
		
			var questions = readJson(string(categoriesToInclude[randCat]) + ".json");
		
			//TODO REVISAR, el total de cada categoria viene en categories.json
			var randQuestion = irandom(array_length(questions)-1);
			if(randQuestion < 0) randQuestion = 0;
			var question = questions[randQuestion];
			
			
			if(!check_new_question(question.id)){
				var repeater = false;
				if(!array_length(selection)){
					array_push(selection,question);	
					count--;
				}else{
					for(var i = 0; i < array_length(selection); i++){
						if(selection[i].id == question.id){
							repeater = true;
							break;
						}
					}
				
					if(!repeater){
						array_push(selection,question);
						count--;
					}
				}
			}
			
		}
		
		
		//Convierte opciones en array
		for(var i = 0; i < array_length(selection); i++){
			selection[i].options = splitString(selection[i].options,",");
			//selection[i].correct = splitString(selection[i].correct,",");// -> "1,2,3" = [1,2,3]
		}
			
		
		//Crea lista mezclada
		var listShufle = ds_list_create();
		for(var i = 0; i < array_length(selection);i++){
			ds_list_add(listShufle,selection[i]);
		}
		ds_list_shuffle(listShufle);
			
			
		//Crea array contador de categorias que han caido
		for(var i = 0; i < array_length(categories);i++){
			ds_list_add(questionsByCategory,{id:categories[i].id, total:0,name:categories[i].name})
		}
		
		//Crea queue, setea la categoria a la pregunta, hace recuento de las categorias que han salido.
		for(var i = 0; i < ds_list_size(listShufle); i++) {
			var category = find_category(listShufle[|i].id);
			listShufle[|i].category = category;
			for(var k = 0; k < ds_list_size(questionsByCategory);k++){
				if(questionsByCategory[| k].name == category) questionsByCategory[| k].total++; 
			}
			
			ds_queue_enqueue(queueQuiz,listShufle[|i])
		}
		ds_list_destroy(listShufle)
				
		
	
	}
	
	
	static check_new_question = function(_question_id){
		//Comprueba si la pregunta es nueva
		var check = false;
		for(var i = 0; i < array_length(DATA.userData[? "QuestionsAnswered"]); i++){
			if(DATA.userData[? "QuestionsAnswered"][i] == _question_id){
				check = true;
				break;
			}
		}
		return check;
	}
	
	static find_category = function(_value){
		var idQ = string_copy(_value,1,1);
		for(var i = 0; i < array_length(categories);i++){
			if(categories[i].id == idQ) return categories[i].name;
		}
	}
	

	static get_question = function(){
		return ds_queue_dequeue(queueQuiz);
	}
	
	static questions_remaining = function(){
		return ds_queue_size(queueQuiz)	;
	}
	
	static destroy = function(){
		ds_queue_destroy(queueQuiz);
	}
	

}