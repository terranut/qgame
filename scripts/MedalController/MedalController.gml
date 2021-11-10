
function MedalController():RoomController() constructor{
	name = "MedalControler";
	pig = undefined;
	medalList = undefined;
	
	#region CONSTRUCTOR
		medalList = instance_create_depth(0,170,9,oMedalList)
		pig = new NPCAssistantPig(132,479,"Assistant",-1);
		pig.speak(["Selecciona una medalla"]);
		pig.state = pig.waiting_medal;
		create()
	#endregion

	


}