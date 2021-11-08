

function startRoomQuiz(){
	print("START ROOM QUIZ")
	randomize();
	layer_set_visible("Background",false);
	
	layer_set_visible("Colliders",false);
	layer_create(9,"Sequences")
	instance_create_layer(0,0,"Control",oMenu)
	instance_create_layer(0,0,"Control",oGrid);
	instance_create_layer(0,0,"Control",oGuiQuiz);
	instance_create_layer(0,0,"Control",oQuiz);
	
	layer_set_visible("blur",false)

	
	
		
	
}