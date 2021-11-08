/// @description BUILD PAGE

global.medalSelected = undefined;

for(var i = 0; i < array_length(medalList); i++){
	medalList[i].destroy()
}
medalList = [];

var medalWidth = 100;
var width = (medalWidth*4)-30;
x = (display_get_gui_width()/2) - (width/2)
var xx =  x
var yy = y

var ii = currentPage * 8;
var kk = ii + 8;
var kk = clamp(kk,0,array_length(medalListData))

for(var i = ii ; i < kk; i++){
	//Si la medalla está en propiedad
	var locked = !findArray(DATA.userData[? "MedalsUnlocked"],medalListData[i].id);
	var medal = new Medal(
		xx,
		yy,
		medalListData[i].name,
		medalListData[i].value,
		medalListData[i].total,
		medalListData[i].id,
		medalListData[i].description,
		medalListData[i].categories,
		locked
	);	
	array_push(medalList,medal);
	if(i == 3 || i == 7 || i == 11 || i == 15 || i == 19){
		yy += 110;
		xx = x;
	}else xx += medalWidth;
}


