
function WarehouseController() constructor{
	
	grid = oGrid.grid;
	warehousePigs = undefined;

		
	#region CONSTRUCTOR
		state = waiting
		layer_set_visible("Colliders",false);
		warehousePigs = DATA.warehousePigs;
		span_pigs()
	#endregion
	
	
	#region STATES
		static waiting = function(){}
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
	
	
	static draw = function(){}
	//STEP WAREHOUSE
	static step = function(){
		state();
	}
	
	//DESTROY WAREHOUSE
	static destroy = function(){}


}