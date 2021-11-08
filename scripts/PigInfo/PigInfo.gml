
function PigInfo(_x,_y,_name,_live,_right,_wrong,_spr = spr_pig_idle):GUI() constructor{
		drawGui = false;
		width = 70;
		height = 40;
		x = _x-(width/2)
		y = _y+12;
		live = _live;
		right = _right;
		wrong = _wrong;
		name = _name;
		wrapperName = new Wrapper(x+1,y+13,width-2,13,spr_transparent)
		namePig = new Text(x+width/2,y+20,name,c_white,global.font_classic,fa_center,fa_middle);
		heartBar = new HeartBar(x+8,y+7,live);
		rightAnswers = new CountSprite(x+10,y+32,spr_done_icon,right,"Aciertos",c_white,global.font_classic);
		wrongAnswers = new CountSprite(x+43,y+32,spr_close_icon,wrong,"Fallos",c_white,global.font_classic);
		elements = [wrapperName,namePig,heartBar,rightAnswers,wrongAnswers]
		create();
		
		static setLive = function(_value){heartBar.value = _value;}
		static setRight = function(_value){rightAnswers.value = _value;}
		static setWrong = function(_value){wrongAnswers.value = _value;}
	
		
		static extra_step = function(){
			instance.visible = !oMenu.open
		}
	
	
}

