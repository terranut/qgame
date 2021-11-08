
function destroyInstances(instances){
	
	for(var i = 0; i < array_length(instances); i++){
		instance_destroy(instances[i]);
	}

}