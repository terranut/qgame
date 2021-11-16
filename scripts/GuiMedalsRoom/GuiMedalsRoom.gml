function GuiMedalsRoom():GUI() constructor{
	resourcesList = [
	{name:"diamons", value: DATA.userData[? "Diamons"], spr:spr_diamon, helpText: "Diamons"},
	{name:"storePigs",value:ds_list_size(DATA.warehousePigs), spr:spr_pig_idle, helpText: "Stored Pigs"},
	];
	resourcesPanel = new Resources(resourcesList);

	title = new Text((display_get_gui_width()/2),(display_get_gui_height()/2)-140,"SELECCIONA UNA OPCIÓN",c_white,global.font_title_mini,fa_center,fa_middle)
	rightArrow =  new SpriteButton((display_get_gui_width()/2)+240,250,spr_arrow_right,"Preview",function(){
		with(oControllerRoom) control.pig.silence()
		with(oMedalList){
			if(currentPage <= ( array_length(medalList)/8 )) currentPage++;
			event_user(0)
		}
	})
	leftArrow = new SpriteButton((display_get_gui_width()/2)-250,250,spr_arrow_left,"Preview",function(){
		with(oControllerRoom) control.pig.silence()
		with(oMedalList){
			if(currentPage == 0) exit;
			currentPage--;
			if(currentPage < 0) currentPage = 0;
			event_user(0)
		}
	})
	startButton = new TextButton("Start quiz",0,400,function(){
		room_goto(kitchen)
	},120,2);
	startButton.x = (display_get_gui_width()/2) - (startButton.width/2)

	elements = [title,rightArrow,leftArrow,startButton]
	create();
	
	
	static  extra_step = function(){
		if(global.medalSelected){
			if(global.medalSelected.completed || global.medalSelected.locked ){
				startButton.disable = true;
			}else startButton.disable = false;
		}else startButton.disable = true;

		//if(oMenu.open) startButton.disable = true;	
		
	}
	
	
	


}