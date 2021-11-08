
function ScorePanel(_diamons = 1,_pigs = 2,_unanswered = 3,_answered = 4):GUI() constructor{
	drawGUI = false;
	width = 168;
	height = 128;
	
	diamons = _diamons;
	pigs = _pigs;
	unanswered = _unanswered;
	answered = _answered;
		
	x = (display_get_gui_width()/2)-(width/2)
	y = (display_get_gui_height()/2) - height/2;
	
	
	var resultText = "RESULTS";
	result =  new Text(x+width/2,y-30,resultText,c_white,global.font_title,fa_center,fa_middle);
	
	diamons = new CountIcon(x+12,y+16,spr_diamon,0,diamons,"Diamons",70);
	pigs = new CountIcon(x+86,y+16,spr_pig_icon,0,pigs,"Pigs",70);
	
	unanswered = new CountIcon(x+12,y+42,spr_font_title_mini,21,unanswered,"Unanswered",70);
	answered = new CountIcon(x+86,y+42,spr_font_title_mini,0,answered,"Answered",70);
	
	optionsWrapper = new Wrapper(x+(width/2)-50,y+height-55,100,40,spr_wrapper_1);
	warehouseButton = new IconButton(x+50,y+height-42,19,"Warehouse",function(){
		room_goto(warehouse)
		audio_stop_all()
	});
	startButton = new IconButton(x+70,y+height-42,24,"Start Quiz",function(){
		room_goto(medals);
		audio_stop_all()
	},32,16);
	exitButton = new LabelButton(x+110,y+height-42,"Exit","Exit",function(){
		room_goto(Title)
		audio_stop_all()
	
	},global.font_classic)
	
	elements = [result,diamons,pigs,unanswered,answered,optionsWrapper,warehouseButton,startButton,exitButton]
	create()
	
		
}