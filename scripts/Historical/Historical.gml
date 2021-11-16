
function HistoricalAnswers():GUI() constructor{
	name = "HistoricalAnswers";
	width = 135
	height = 10
	x = room_width - width -16
	y = 36;
	answers = [];
	create();

	static create_elements = function(){
		height = 0;
		
		var xx = x;
		var yy = y;
		for(var i = 0; i < array_length(answers); i++){
			
			var pigAnswer = new PigAnswer(xx,yy)
			
			array_push(elements,pigAnswer)
			yy += pigAnswer.height + 10;
			height += pigAnswer.height + 10;
			//var spr = new StaticSprite(xx+18,yy+15,spr_pig_idle);
			//var pigName = new Text(xx+55,yy+15, answers[i].name,c_white,global.font_classic,fa_center,fa_middle)
			//var answer = new TextBox(xx+10,yy+30,answers[i].answer,width-20,font_m5,c_white)	
			//answer.focusPig = answers[i].name 
			//pigName.focusPig = answers[i].name 
			//spr.focusPig = answers[i].name 
			
			//array_push(elements,spr,pigName,answer)
			//yy += spr.height + 10 + answer.height + 10;
			//height += spr.height + 10 + answer.height + 10;
		}
		
		array_insert(elements,0,new WrapperRectangle(x,y,width,height,c_black,.3))
		
	}


	static add = function(_pig){
		var find = false;
		for(var i = 0; i < array_length(answers); i++){
			if(answers[i].name == _pig.name) find = true
		}
		if(!find) array_push(answers,{name: _pig.name, answer: _pig.answer})
		
		clean_elements()
		create_elements()
	}

	static erase = function(){
		answers = [];
		clean_elements();
	}
	
	static extra_step = function(){
		
		
	}



}//END CLASS