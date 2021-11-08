
function QuizOptions():GUI() constructor{
	width = 92;
	height = 38;
	x = display_get_gui_width()-32-width;
	y = display_get_gui_height()-32-height;
	wrapper = spr_wrapper_1
	exitButton = new IconButton(x+14,y+11,7,"Exit Game",function(){ game_end() });
	restartButton = new IconButton(x+38,y+11,5,"Restart Quiz",function(){ room_restart() });
	optionsButton = new IconButton(x+62,y+11,18,"Options",function(){
		with(oMenu){
			event_perform(ev_keyrelease,vk_escape)
		}
	});
	elements = [exitButton,restartButton,optionsButton]
	create();
		
			
	static extra_step = function(){
		instance.visible = !oMenu.open
	}
}

