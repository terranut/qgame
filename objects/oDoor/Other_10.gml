/// @description TOOGLE

if(open){
	state = "closing";
	sprite_index = spr_door_closing;
}else{
	state = "opening";
	sprite_index = spr_door_opening;	
}
open = !open;