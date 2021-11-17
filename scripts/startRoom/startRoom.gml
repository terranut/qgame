
function startRoom(){
	
	layer_create(9,"Control")
	instance_create_layer(0,0,"Control",oGrid);
	layer_set_visible("Colliders",false);
	layer_create(10,"Sequences")

	var roomName = room_get_name(room);
	var menu = new Menu()
	
	//GREYSCALE
	layer_create(10,"Effects")
	var fx = fx_create("_filter_greyscale")
	layer_set_fx("Effects",fx)
	
	var _fx_struct = layer_get_fx("Effects");
	var _params = fx_get_parameters (_fx_struct);
	_params.g_Intensity = 0;
	fx_set_parameters (_fx_struct, _params);
	
	
	//BLUR	
	layer_create(10,"Effects_blur")
	var fx = fx_create("_filter_large_blur")
	layer_set_fx("Effects_blur",fx)
	
	var _fx_struct = layer_get_fx("Effects_blur");
	var _params = fx_get_parameters (_fx_struct);
	_params.g_Radius = 0;
	fx_set_parameters (_fx_struct, _params);
	
	
	
		

	
	
	switch(roomName){
		case "Title":
			var controllerRoom = new TitleController()	
			controllerRoom.gui = new GuiTitleRoom()
			
			
		break;
		case "Title2":
			var controllerRoom = new TitleController()	
			controllerRoom.gui = new GuiTitleRoom()
		break;
		case "Title3":
			var controllerRoom = new TitleController()	
			controllerRoom.gui = new GuiTitleRoom()
		break;
		
		case "medals":
			var controllerRoom = new MedalController()	
			controllerRoom.gui = new GuiMedalsRoom()
		
		break;
		
		case "warehouse":
			var controllerRoom = new WarehouseController()
			controllerRoom.gui = new GuiWarehouse();
		
		break;
		
		default:
			randomize();
			
			toolBar = new ToolBar()
			toolBar.open = true
			
			layer_set_visible("Background",false);
			instance_create_layer(0,0,"Control",oGuiQuiz);
			instance_create_layer(0,0,"Control",oQuiz);
			layer_set_visible("blur",false)
			
			var quizOption = new QuizOptions();
			resourcesList = [
				{name:"diamons", value: DATA.userData[? "Diamons"], spr:spr_diamon, helpText: "Diamons"},
				{name:"alivePigs",value:0, spr:spr_pig_idle, helpText: "Alive pigs"},
				{name:"deadPigs",value:0, spr:spr_skull, helpText: "Dead pigs"},
			];
			resourcesPanel = new Resources(resourcesList);
			
	
			
			
			
		break;
		
	}
	
	

}