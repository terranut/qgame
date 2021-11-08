function getTranslate(match){
	var val = global.displayValues
	for(var i = 0 ; i < array_length(val); i++){
		if(val[i].match == match) return val[i].value
	}
	return "unknow";
}