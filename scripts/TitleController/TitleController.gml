
function TitleController():RoomController() constructor{
	name = "TitleController";
	grid = oGrid.grid;
	warehousePigs = undefined;
	

	#region CONSTRUCTOR
		layer_set_visible("Colliders",false)
		warehousePigs = DATA.warehousePigs;
		create();
		span_pigs()
	#endregion
	
	static span_pigs = function(){
		print("total pigs to span", ds_list_size(warehousePigs))
		for(var i =0; i < ds_list_size(warehousePigs); i++){
			var flor = grid.get_free_position();
			var pig = undefined;
			if(flor)
				pig = new NPCPig(flor.x,flor.y,
					warehousePigs[| i].name,
					warehousePigs[| i].live,
					warehousePigs[| i].rightAnswers,
					warehousePigs[| i].wrongAnswers
				)
		}
	}
	
	
	

}