
function startRoom(){
	
	layer_create(9,"Control")
	instance_create_layer(0,0,"Control",oMenu)
	instance_create_layer(0,0,"Control",oGrid);
	layer_set_visible("Colliders",false);
	layer_create(10,"Sequences")
	
	var roomName = room_get_name(room);
	

	switch(roomName){
		case "Title":
			var controllerRoom = new TitleController()	
			controllerRoom.gui = new GuiTitleRoom()
		
		break;
		
		case "medals":
			var controllerRoom = new MedalController()	
			controllerRoom.gui = new GuiMedalsRoom()
		
		break;
		
		case "warehouse":
			var controllerRoom = new WarehouseController()	
		
		break;
		
		default:
			randomize();
			layer_set_visible("Background",false);
			instance_create_layer(0,0,"Control",oGuiQuiz);
			instance_create_layer(0,0,"Control",oQuiz);
			layer_set_visible("blur",false)
		break;
		
	}
	
	

}