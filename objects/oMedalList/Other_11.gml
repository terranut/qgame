/// @description 
for(var i = 0; i < array_length(medalList); i++){
	medalList[i].focus = false
}

with(oMedals){
	pig.silence()
	pig.state = pig.waiting_medal
}