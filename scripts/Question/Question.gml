
//QUESTION CLASS
function Question(_question) constructor{
	id = _question.id;
	title = _question.title;
	options = _question.options;
	totalOptions = 0;
	
	category =  _question.category;
	queueAnswers = ds_queue_create();
	
	#region CONSTRUCTOR
		totalOptions = array_length(options);
		
		//Crea lista con opciones
		var list = ds_list_create();
		for(var i = 0; i < array_length(options); i++){
			ds_list_add(list,options[i])	
		}
		//Desordena la lista
		ds_list_shuffle(list);
		//Crea queue con las opciones
		for(var i = 0; i < ds_list_size(list); i++){
			ds_queue_enqueue(queueAnswers,list[| i]);	
		}
		
		
	#endregion
	
	
	//Comprueba que la respuesta en _value es correcta
	static check_answer = function(_value){
		print("Opciones",options,"Respuesta",_value)
		if(options[0] == _value) return true;
		else return false;
	}
	

	//Devuelve respuestas restantes
	static answers_remaining = function(){
		return ds_queue_size(queueAnswers)
	}
	
	static get_answer = function(){
		return ds_queue_dequeue(queueAnswers)
	}
	
	static destroy = function(){
		ds_queue_clear(queueAnswers)	
	}



}//END CLASS
