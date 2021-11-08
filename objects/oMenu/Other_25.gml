/// @description DESTROY
print("DESTROY")
for(var i = 0; i < array_length(elements); i++){
	elements[i].destroy();	
}
elements = [];
