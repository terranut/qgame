/// @description 
if(global.medalSelected){
	if(global.medalSelected.completed || global.medalSelected.locked ){
		startButton.disable = true;
	}else startButton.disable = false;
}else startButton.disable = true;

if(oMenu.open) startButton.disable = true;