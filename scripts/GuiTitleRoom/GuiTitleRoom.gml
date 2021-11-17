
function GuiTitleRoom():GUI() constructor{
	name = "GUI TITLE ROOM";
	width = 200;
	height =190;
	
	x = 64;
	y = (room_height/2) - (height/2)
	wrapper = spr_wrapper_14
	//endPosition = [  64 , (room_height/2) - (height/2) ]
	
	titleText = "MILLIONS OF PIGS";
	title = new Text(x+6,y-20,titleText,c_white,global.font_title_mini,fa_center,fa_middle)
	title.x = title.x+(width/2) - (title.width/2)

	var font = global.font_classic;
	var ww = 120;

	start = new TextButton("Start",x,y+30,function(){room_goto(medals)},ww,2,font)
	start.x = start.x + (width/2) - (start.width/2);

	warehouseButton = new TextButton("Warehouse",x,y+65,function(){room_goto(warehouse)},ww,19,font)
	warehouseButton.x = warehouseButton.x + (width/2) - (warehouseButton.width/2)

	options = new TextButton("Options",x,y+100,function(){
		with(oGuiController)if(gui.name == "Menu") gui.toggle_menu()
		
	},ww,18,font)
	options.x = options.x + (width/2) - (options.width/2)

	quit = new TextButton("Quit game",x,y+135,function(){game_end()},ww,7,font)
	quit.x = quit.x + (width/2) - (quit.width/2)

	elements = [title,start,warehouseButton,options,quit]
	//elements = [title,wrapperBack]
	create();


}