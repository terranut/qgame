/// @description 
for(var i = 0; i < array_length(medalList); i++){
	medalList[i].focus = false
}
oControllerRoom.control.pig.silence()
oControllerRoom.control.pig.state = oControllerRoom.control.pig.waiting_medal
