//INPUT STRING WITH SEPARATOR
//OUTPUT ARRAY
function splitString(msg,separator){
	
	var slot = 0;
	var splits = []; //array to hold all splits
	var str2 = ""; //var to hold the current split we're working on building

	var i;
	for (i = 1; i < (string_length(msg)+1); i++) {
	    var currStr = string_copy(msg, i, 1);
	    if (currStr == separator) {
	        splits[slot] = str2; //add this split to the array of all splits
	        slot++;
	        str2 = "";
	    } else {
	        str2 = str2 + currStr;
	        splits[slot] = str2;
	    }
	}
	
	for(var i = 0; i < array_length(splits); i++){
		var str = splits[i];
        var firtsCharacter = string_copy(str, 0, 1);
		if(string_char_at(str, 1 ) == " "){
			splits[i] = string_copy(str, 2, string_length(str));
		}
	}
	
	return splits;
	
}