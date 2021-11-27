
function Medal(_id = 0,_name = "",_value = 0,_total = 0,_description = "",_categories = [],_price = 0,_locked = 0) constructor{
	id = _id;
	name = _name;
	value =  _value;
	total = _total;
	description = _description;
	categories = _categories;
	price = _price;
	locked = _locked;
	

	static is_completed = function(){
		return (value == total)
	}
	
	static is_locked = function(){
		return (locked == 1)
	}
	
	
	
	static stringify = function(){
		return json_stringify(self)
	}
	

	static set = function(_val){
		var parse = json_parse(_val)
		var arr = variable_struct_get_names (self);
		for ( var i = 0 ; i < array_length (arr); i ++;)
			self[$ arr[i]] = parse[$ arr[i]]
	}
	

}