
function Resources(_resourcesList):GUI() constructor{
	width = 200;
	height = 38;
	x =	16
	y = 16
	resourcesList = _resourcesList
	elements = []
	
	var xx = x+10;
	var yy = y;
	for(var i = 0; i < array_length(resourcesList);i++){
		var element = new CountSprite(xx,yy,resourcesList[i].spr,resourcesList[i].value,resourcesList[i].helpText);
		element.name = resourcesList[i].name
		array_push(elements,element)
		xx += element.width+20
		
	}
	create();

	static set = function(_name,_value){
		for(var i = 0; i < array_length(elements);i++){
			if(elements[i].name == _name) elements[i].value = _value;
		}
	}
	
}