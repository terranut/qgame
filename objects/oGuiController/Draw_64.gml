/// @description 
if(!drawGui) exit;

if(gui && visible){
	gui.draw()
	gui.extra_draw()
	exit;	
}

for(var i = 0; i < array_length(elements); i++){
	elements[i].draw();	
}