
function GuiWarehouse():GUI() constructor{
	resourcesList = [
	{name:"diamons", value: DATA.userData[? "Diamons"], spr:spr_diamon, helpText: "Diamons"},
	{name:"storePigs",value:ds_list_size(DATA.warehousePigs), spr:spr_pig_idle, helpText: "Stored Pigs"},
	];
	resourcesPanel = new Resources(resourcesList);
	
	create();
}