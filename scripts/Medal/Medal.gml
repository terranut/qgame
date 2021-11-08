
function Medal(_x,_y,_name = "Medal",_value = 0,_total = 0,_id = 0,_description = "",_categories = [],_locked = true):GUI() constructor{
	x = _x;
	y = _y;
	width = 100;
	height = 80;
	drawGUI = false;
	focus = false;
	
	name = _name
	value = _value;
	total = _total;
	id = _id;
	description = _description;
	categories = _categories;
	locked = _locked;
	

	ww = width-30;
	hh = height-20;
	
	wrapperMedal = new Wrapper(x,y,ww,hh,spr_wrapper_9)
	medalChar = new MedalChar(x,y,string_copy(name,1,1));
	medalChar.x = x + (ww/2) - (medalChar.width/2)
	medalChar.y = y + (hh/2) - (medalChar.height/2)
	completed = new StaticSprite(x,y,spr_icons,20);
	completed.elementVisible = (value == total)
	lockedWrapper = new WrapperRectangle(x,y,20,20,c_red,.5);
	lockedWrapper.elementVisible = locked
	
	bar = new LargeProgressBar(x,y+hh+5,ww,16,value,"Progress",total,global.color_red,c_white,true)
	elements = [wrapperMedal,medalChar,bar,lockedWrapper,completed]
	create()
	

		
	static extra_step = function(){
		if(oMenu.open) exit;
		var mouseX = mouse_x;
		var mouseY = mouse_y;
		
		if(mouse_check_button_released(mb_left) && point_in_rectangle(mouseX,mouseY,x,y,x+ww,y+hh)){
			print(medal_info())
			with(oMedalList) event_user(1)
			global.medalSelected = medal_info()
			focus = true;	
		}
	
	}
	
	static extra_draw = function(){
		if(focus) draw_rectangle(x,y,x+ww,y+hh,1)
	}

	static add_value = function(){
		value++;
		bar.value = value;
		global.medalSelected = medal_info()
	}
	
	static medal_info = function(){
		return {
			id:id,
			name:name,
			description:description,
			value:value,
			total:total,
			categories:categories,
			completed: (value == total),
			locked:locked}
	}
	
}