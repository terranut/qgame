
function MedalController() constructor{
	pig = undefined;
	medalList = undefined;
	
	#region CONSTRUCTOR
		medalList = instance_create_depth(0,170,9,oMedalList)
		pig = new NPCAssistantPig(132,479,"Assistant",-1);
		pig.speak(["Selecciona una medalla"]);
		pig.state = pig.waiting_medal;
	#endregion

	static draw = function(){}
	//STEP WAREHOUSE
	static step = function(){
	
	}
	
	//DESTROY WAREHOUSE
	static destroy = function(){}


}