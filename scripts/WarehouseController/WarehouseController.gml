
function WarehouseController():RoomController() constructor{
	name = "WarehouseController";
	
	cameraTargetY  = 0;
	#macro view view_camera[0]
	
	#region CONSTRUCTOR
		state = waiting
		layer_set_visible("Colliders",false);
		warehousePigs = DATA.warehousePigs;
		create();
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
	
	
	
	//STEP WAREHOUSE
	static step = function(){
		#region CONTROL CAMERA
			var view_height = camera_get_view_height(view);
			var height_room = room_height;

			var mouse_input = mouse_wheel_down() - mouse_wheel_up();
			cameraTargetY = cameraTargetY + mouse_input*30;
			cameraTargetY = clamp(cameraTargetY,0,height_room-540)

			var camera_y = camera_get_view_y(view);
			var camera_x = camera_get_view_x(view);
			camera_y += (cameraTargetY - camera_y) * 0.1;
			camera_y = clamp(camera_y,0,height_room-540);
			camera_set_view_pos(view,camera_x,camera_y);
		
		#endregion
	}
	
	//DESTROY WAREHOUSE
	


}