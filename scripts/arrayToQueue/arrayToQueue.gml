
function arrayToQueue(_arr){
	var queue = ds_queue_create();
	for (var i = 0; i < array_length(_arr); i++){
		ds_queue_enqueue(queue,_arr[i]);	
	}
	return queue;
}