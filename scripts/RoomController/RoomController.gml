
function RoomController(){

	static create = function(){
		print("CREATE ROOM CONTROLLER")
		instance = instance_create_depth(0,0,100,oControllerRoom);
		instance.control = self;
		instance.name = name
	}	

	static step = function(){}
	static draw = function(){}
	static destroy = function(){}


}