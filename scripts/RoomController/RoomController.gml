
function RoomController(){
	name = "RoomController";
	grid = oGrid.grid;
	warehousePigs = undefined;
	

	static create = function(){
		print("CREATE ROOM CONTROLLER")
		instance = instance_create_depth(0,0,100,oControllerRoom);
		instance.control = self;
		instance.name = name;
		warehousePigs = DATA.warehousePigs;
		span_pigs();
	}	
	
	
	static span_pigs = function(){
		var count = choose(4,5,6,7,8)
		var pigs = []
		repeat(count){
			
			var repeater = true;
			while(repeater){
				var rand = irandom(ds_list_size(warehousePigs)) - 1;
				if(rand < 0) rand = 0;
				var pig = warehousePigs[| rand];
				
				if(!array_length(pigs)){
					array_push(pigs,pig);
					repeater = false;
				}else{
					
					var exist = false;
					for(var i = 0; i < array_length(pigs); i++){
						if(pigs[i].name == pig.name) exist = true;
					}
					if(!exist){
						array_push(pigs,pig);
						repeater = false;
					}
					
				}
			}
			
		}
		
		
		for(var i =0; i < array_length(pigs); i++){
			var flor = grid.get_free_position();
			var pig = undefined;
			if(flor)
				pig = new NPCPig(flor.x,flor.y,
					pigs[i].name,
					pigs[i].live,
					pigs[i].rightAnswers,
					pigs[i].wrongAnswers
				)
		}
	}

	static step = function(){}
	static draw = function(){}
	static destroy = function(){
		print("RoomController destroy",name)
		instance_destroy(instance)
	
	}


}