
function readJson(fileName){
	
	var data = undefined;

	if(file_exists(working_directory+ "/gameData/" + fileName)){
		var json = "";
		var file = file_text_open_read(working_directory +"/gameData/" + fileName);
	
		while(file_text_eof(file) == false){
			json += file_text_readln(file);
		}
	
		file_text_close(file);
		data = json_parse(json);
	
	}

	return data;

}