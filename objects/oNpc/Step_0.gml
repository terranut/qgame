/// @description
if(oMenu.open) npcEnable = false
else npcEnable = true

if(npc){
	if(!npcEnable) exit;
	npc.step()
}