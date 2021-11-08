
function GridQuiz() constructor{
	gridRoom = ds_grid_create(room_width/32,room_height/32);
	floorList = [];
	doorList = [];
	
	readFloor();
	readDoors();
	
	static draw = function(){
		
		draw_set_font(font_m5);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		var mouseCell = get_cell(mouse_x,mouse_y);
		draw_text(50,20,"Mouse cell"+string(mouseCell.x)+","+string(mouseCell.y));
		draw_text(250,20,ds_grid_get(gridRoom,mouseCell.x,mouseCell.y));
		draw_text(120,20,string(mouse_x) + ", "+string(mouse_y));
		var gridW = ds_grid_width(gridRoom);
		var gridH = ds_grid_height(gridRoom);
 	
		for (var i = 0; i < gridW; i++){
			for (var j = 0; j < gridH; j++){
		
				var xx = i*32;
				var yy = j*32;
				draw_set_color(c_white);
				if(gridRoom[# i,j] != 0) draw_text(xx+32/2,yy+32/2,gridRoom[# i,j]);
				draw_set_alpha(.1);
				draw_set_color(c_red);
				draw_rectangle(xx,yy,xx+30,yy+30,1);
				draw_set_alpha(1);
			
			
			}
		}
		resetFont();

		
	}
	
	static readFloor = function(){
		
		//OBTENGO TODOS LOS oFlor de la capa Colliders
		//Creo array con todos los posibles lugares donde instanciar

		var elements = layer_get_all_elements("Colliders");
		for (var i = 0; i < array_length(elements); i++){
	
			if (layer_get_element_type(elements[i]) == layerelementtype_instance){
				var layerelement = elements[i];
		        var inst = layer_instance_get_instance(layerelement);
				var objectName = object_get_name(inst.object_index);
	
				if(objectName == "oFlor"){
					var instWidth = sprite_get_width(inst.sprite_index);
					var cell = get_cell(inst.x,inst.y)
					array_push(floorList,{x:inst.x + instWidth/2 ,y:inst.y})
					ds_grid_add(gridRoom,cell.x,cell.y,FLOOR) 
				}
		
			}
		}
		
	}

	static readDoors = function(){
		
		//lectura de puertas
		var elements = layer_get_all_elements("Instances");
		for (var i = 0; i < array_length(elements); i++){
	
			if (layer_get_element_type(elements[i]) == layerelementtype_instance){
				var layerelement = elements[i];
		        var inst = layer_instance_get_instance(layerelement);
				var objectName = object_get_name(inst.object_index);
	
				if(objectName == "oDoor"){
					var cell = get_cell(inst.x,inst.y-5);
					array_push(doorList,{x:inst.x,y:inst.y,doorID:inst,state:"close"});
					ds_grid_add_region(gridRoom,cell.x,cell.y,cell.x,cell.y,inst)
			
				}
		
			}
		}
	
	
	
	}

	static get_free_position = function(){
		var repeater = true;
		var flor = undefined;
			
		while(repeater){
			var nRand = irandom(array_length(floorList)-1);
			flor = floorList[nRand];
			var cell = get_cell(flor.x,flor.y);
			if(ds_grid_get(gridRoom,cell.x,cell.y-1) == 0){
				ds_grid_add_region(gridRoom,cell.x,cell.y-1,cell.x,cell.y-1,PIG)
				repeater = false;
			}
		}
		
		return flor;
		
	}

	static destroy = function(){
		ds_grid_destroy(gridRoom);
		floorList = [];
	}
	
	
	static get_cell = function(_x,_y){
		var xx = (_x div 32);
		var yy = (_y div 32);
		return {x:xx,y:yy}	
	}
	
	static get_content = function(_x,_y){
		var cell = get_cell(_x,_y)
		return gridRoom[# cell.x,cell.y];	
	
	}
	

}