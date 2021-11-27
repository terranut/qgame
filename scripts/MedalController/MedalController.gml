
function MedalController():RoomController() constructor{
	name = "MedalController";
	pig = undefined;
	medalList = undefined;
	medalListData = DATA.userData[? "Medals"]
	print("MEDAL CONTROLLER",medalListData)
	
	//PAGINATION
	gridSize = 110;
	gridWidth = 4;
	gridHeight = 2;
	gridX = (room_width/2) - ((gridWidth*gridSize)/2)
	gridY = (room_height/2) - ((gridHeight*gridSize)/2)
	pages = array_length(medalListData) / (gridWidth*gridHeight);
	currentPage = 0;

	#region CONSTRUCTOR
		pig = new NPCAssistantPig(132,479,"Assistant",-1);
		pig.speak(["Selecciona una medalla"]);
		//pig.state = pig.waiting_medal;
		
		warehousePigs = DATA.warehousePigs;
		build_page()
		create()
	#endregion
	
	
	static build_page = function(){
		var padding = 10;
		var medalIndex = 0;
		medalIndex += 7 * currentPage;
		
		//DESTROY MEDALCARDS
		with(oGuiController) if(gui.name == "MedalCard") gui.destroy()
		
		for (var h = 0; h < gridHeight; h++){
			for (var w = 0; w < gridWidth; w++){
				var xx = (w*gridSize)+gridX;
				var yy = (h*gridSize)+gridY;
				if (array_length(medalListData)-1 >= medalIndex){
					var medalData = medalListData[medalIndex];
					var medal = new MedalCard(xx+padding,yy+padding,medalData)
					medalIndex++;
				}
			}
		}
		
	}
	
	static draw = function(){
		
		//for (var h = 0; h < gridHeight; h++){
		//	for (var w = 0; w < gridWidth; w++){
		//		var xx = (w*gridSize)+gridX;
		//		var yy = (h*gridSize)+gridY;
		//		draw_rectangle(xx,yy,xx+gridSize,yy+gridSize,1);
		//	}
		//}
	
	}
	
	static step = function(){}
	
	static next_page = function(){
		if(currentPage > pages - 1) exit;
		currentPage++;
		build_page()
	}
	static previus_page = function(){
		if(currentPage <= 0) exit
		currentPage--;
		build_page()
	}

	
}