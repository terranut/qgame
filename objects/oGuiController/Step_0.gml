/// @description 


if(gui && visible){
	gui.step()
	gui.extra_step()
	exit;	
}

for(var i = 0; i < array_length(elements); i++){
	elements[i].step();	
}