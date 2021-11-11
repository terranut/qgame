
function DataFile() constructor{
	warehousePigs = undefined;
	userData = undefined;
	preferences = undefined;
	initialPigs = 50;
	
	
	#region CONSTRUCTOR
		//Si no existe WAREHOUSE el archivo lo crea por primera vez
		if(!file_exists("warehouse.dat")) initialWarehouse();
		else loadWarehouse();
	
		if(!file_exists("userData.dat")) initialUserData();
		else loadUserData();
		
		if(!file_exists("preferences.ini")) initialPreferences();
		else loadPreferences();
	#endregion
	
	static initialPreferences = function(){
		print("INITIAL Preferences")
		ini_open("preferences.ini");
		ini_write_real( "user" , "full_screen" ,0 );
		ini_write_real( "user" , "font_classic" ,0 );
		ini_write_string( "user" , "language" ,"esp" );
		ini_write_real( "settings" , "sound" ,1);
		ini_write_real( "settings" , "glow" ,1);
		ini_close ();
		loadPreferences();
		
	}
	
	static loadPreferences= function(){
		print("LOAD PREFERENCES")
		
		preferences = {
			user:{
				full_screen: 0,
				font_classic: 0,
				language: "esp",
			},
			settings:{
				sound: 1,
				glow: 1,
			}
			
		}
		
		try{
			ini_open("preferences.ini");
			preferences.user.full_screen = ini_read_real("user","full_screen",0);
			preferences.user.font_classic = ini_read_real("user","font_classic",0);
			preferences.user.language = ini_read_string("user","language","esp");
			preferences.settings.sound = ini_read_real("settings","sound",0);
			preferences.settings.glow = ini_read_real("settings","glow",0);
			
			window_set_fullscreen(preferences.user.full_screen)
			if(preferences.user.font_classic) global.font_talker = global.font_classic_margin
			else global.font_talker = font_m5
			global.glow = preferences.settings.glow;
			
		}catch(error){
			print(error)	
		}
		
	}
	
	static savePreferences = function(){
		preferences.user.full_screen = window_get_fullscreen()
		preferences.user.font_classic = (global.font_talker == global.font_classic_margin)
		preferences.settings.glow = global.glow;
		
		ini_open("preferences.ini");
		ini_write_real( "user" , "full_screen" ,preferences.user.full_screen );
		ini_write_real( "user" , "font_classic" ,preferences.user.font_classic );
		ini_write_string( "user" , "language" ,preferences.user.language );
		ini_write_real( "settings" , "sound" ,preferences.settings.sound);
		ini_write_real( "settings" , "glow" ,preferences.settings.glow);
		ini_close ();
	}
	
	static initialUserData = function(){
		print("INITIAL Data");
		var map = ds_map_create();
		ds_map_add(map,"Diamons",1000);
		ds_map_add(map,"TotalQuestionsAnswered",0);
		ds_map_add(map,"QuestionsAnswered",[]);
		ds_map_add(map,"Medals",initial_medals());
		ds_map_add(map,"MedalsUnlocked",["beginner_bronze","beginner_silver","beginner_gold","smarty_bronze"]);
		var mapWrited = ds_map_write(map);
		
		var _file = file_text_open_write(working_directory + "userData.dat");
		file_text_write_string(_file, mapWrited);
		file_text_close(_file);
		ds_map_destroy(map)
		loadUserData()
	}
	
	static saveUserData = function(){
		print("save userData")
		var map = ds_map_create();
		ds_map_add(map,"Diamons",userData[? "Diamons"]);
		ds_map_add(map,"TotalQuestionsAnswered",userData[? "TotalQuestionsAnswered"]);
		ds_map_add(map,"QuestionsAnswered",userData[? "QuestionsAnswered"]);
		ds_map_add(map,"MedalsUnlocked",userData[? "MedalsUnlocked"]);
		
		//MEDALS
		var medalList = [];
		for(var i = 0; i < array_length(userData[? "Medals"]);i++){
			array_push(medalList, json_stringify(userData[? "Medals"][i]))
		}
		ds_map_add(map,"Medals",medalList);
					
		var mapWrited = ds_map_write(map);
		
		var _file = file_text_open_write(working_directory + "userData.dat");
		file_text_write_string(_file, mapWrited);
		file_text_close(_file);
		ds_map_destroy(map)
	}
	
	//LOAD USERDATA
	static loadUserData = function(){
		print("loadUserData");
		try{
			var file = file_text_open_read(working_directory + "userData.dat");
			var content = file_text_read_string(file);
			userData = ds_map_create();
			ds_map_read(userData,content);
			
			//MEDALS
			var medalList = [];
			for(var i = 0; i < array_length(userData[? "Medals"]);i++){
				array_push(medalList, json_parse(userData[? "Medals"][i]))
			}
			ds_map_set(userData,"Medals",medalList);
			
		}catch(err){
			print(err)
			game_end()
		}
		
	}
	
	static initialWarehouse = function(){
		print("INITIAL Warehouse")
		var list = initial_pigs()
		var listWrited = ds_list_write(list)
		
		var _file = file_text_open_write(working_directory + "warehouse.dat");
		file_text_write_string(_file, listWrited);
		file_text_close(_file);	
		ds_list_destroy(list)
		loadWarehouse();
		
	}
	
	static saveWarehouse = function(){
		print("save warehouse")
		var saveWarehouse = ds_list_create();
		for(var i = 0; i < ds_list_size(warehousePigs);i++){
			var pig = json_stringify(warehousePigs[| i])
			ds_list_add(saveWarehouse,pig)
		}
		var listWrited = ds_list_write(saveWarehouse)
		var _file = file_text_open_write(working_directory + "warehouse.dat");
		file_text_write_string(_file, listWrited);
		file_text_close(_file);
		ds_list_destroy(saveWarehouse)
	}
	
	//LOAD WAREHOUSE
	static loadWarehouse = function(){
		print("loadWarehouse")
		try{
			var file = file_text_open_read(working_directory + "warehouse.dat");
			var content = file_text_read_string(file);
			warehousePigs = ds_list_create();
			ds_list_read(warehousePigs,content);
			for(var i = 0; i < ds_list_size(warehousePigs);i++)
				warehousePigs[| i] = json_parse(warehousePigs[| i])	
			
		}catch(err){
			print(err)
			game_end()
		}
		
	}
	
	//SAVE
	static save = function(){
		saveUserData();
		saveWarehouse();
	}
	
	
	
	
	static initial_pigs = function(){
		var pigs = ds_list_create();
		var total = initialPigs;
		
		var names = ds_list_create();
		count = 0;
		while(count < total){
			var name = randName();
			
			if(!ds_list_find_index(names,name)){
				ds_list_add(names,name)	;
				var pig = {name:name,live:1,rightAnswers:0,wrongAnswers:0};
				pig = json_stringify(pig)
				ds_list_add(pigs,pig);
				count++;
			}
			
		}
		ds_list_destroy(names)
		return pigs;
	}
	
	static initial_medals = function(){
		return [
			json_stringify({id:"beginner_bronze",name:"Beginner Bronze", value: 0, total: 10,description:"Todas las categorías",categories:[0,1,2,3,4,5,6,7],price:0}),
			json_stringify({id:"beginner_silver",name:"Beginner Silver", value: 0, total: 15,description:"Todas las categorías",categories:[0,1,2,3,4,5,6,7],price:0}),
			json_stringify({id:"beginner_gold",name:"Beginner Gold", value: 0, total: 20,description:"Todas las categorías",categories:[0,1,2,3,4,5,6,7],price:0}),
			
			json_stringify({id:"smarty_bronze",name:"Smarty Bronze", value: 0, total: 50,description:"Historia, Ciencias, Geografía, General",categories:[0,5,6,7],price:0}),
			json_stringify({id:"smarty_silver",name:"Smarty Silver", value: 0, total: 80,description:"Historia, Ciencias, Geografía, General",categories:[0,5,6,7],price:0}),
			json_stringify({id:"smarty_gold",name:"Smarty Gold", value: 0, total: 100,description:"Historia, Ciencias, Geografía, General",categories:[0,5,6,7],price:0}),
			
			json_stringify({id:"chronicler",name:"Chronicler", value: 0, total: 50,description:"Historia",categories:[0],price:500}),
			json_stringify({id:"master_chronicler",name:"Master Chronicler", value: 0, total: 80,description:"Historia",categories:[0],price:500}),
			
			json_stringify({id:"gamer",name:"Gamer", value: 0, total: 50,description:"Videojuegos",categories:[1],price:500}),
			
			json_stringify({id:"technologist",name:"Technologist", value: 0, total: 50,description:"Tecnología",categories:[3],price:500}),
			
			json_stringify({id:"scientific",name:"Scientific", value: 0, total: 50,description:"Ciencia",categories:[5],price:500}),
			
			json_stringify({id:"astronomer",name:"Astronomer", value: 0, total: 50,description:"Ciencia",categories:[2],price:500}),
			json_stringify({id:"master_astronomer",name:"Master Astronomer", value: 0, total: 80,description:"Ciencia",categories:[2],price:500}),
			
			json_stringify({id:"cinephile",name:"Cinephile", value: 0, total: 50,description:"Cine y TV",categories:[4],price:500}),
		]	
	}

	static update_pig = function(_pig){
		print("update pig")	
		if(_pig.live <= 0){
			print("kill pig");
			for(var i = 0; i < ds_list_size(warehousePigs);i++){
				if(warehousePigs[| i].name == _pig.name){
					ds_list_delete(warehousePigs,ds_list_find_index(warehousePigs,warehousePigs[| i]))
					break;
				}
			}	
			exit;
		}
		
		for(var i = 0; i < ds_list_size(warehousePigs);i++){
			if(warehousePigs[| i].name == _pig.name){
				warehousePigs[| i].live = _pig.live;
				warehousePigs[| i].rightAnswers = _pig.correct;
				warehousePigs[| i].wrongAnswers = _pig.wrong;
				break;
			}
		}
		
		saveWarehouse();
	}

	static update_stats = function(_question){
		print("update stats")
		var TotalQuestionsAnswered = userData[? "TotalQuestionsAnswered"];
		userData[? "TotalQuestionsAnswered"] = TotalQuestionsAnswered + 1;
		array_push(userData[? "QuestionsAnswered"],_question.id);
		
		//UPDATE MEDAL VALUE
		if(global.medalSelected){
			var medal = global.medalSelected;
			for(var i = 0; i < array_length(userData[? "Medals"]); i++){
				if(userData[? "Medals"][i].id == medal.id) userData[? "Medals"][i].value++
			}
		}
		
	}
	
	static save_log = function(_value){
		//Crea log.dat si el archivo no existe
		if(!file_exists("log.dat")){
			var file = file_text_open_write(working_directory + "log.dat");
			file_text_write_string(file,json_stringify(_value)+"\t ---- \t");
			file_text_close(file);
			exit;
		}
		
		var file = file_text_open_read(working_directory + "log.dat");
		var content = file_text_read_string(file)
		file_text_close(file);
		
		var file = file_text_open_write(working_directory + "log.dat");
		file_text_write_string(file, content +json_stringify(_value)+"\t ---- \t");
		file_text_close(file);
	}

}//END CLASS



	
	