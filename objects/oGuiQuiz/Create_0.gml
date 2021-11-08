/// @description 

resourcesList = [
	{name:"diamons", value: DATA.userData[? "Diamons"], spr:spr_diamon, helpText: "Diamons"},
	{name:"alivePigs",value:0, spr:spr_pig_idle, helpText: "Alive pigs"},
	{name:"deadPigs",value:0, spr:spr_skull, helpText: "Dead pigs"},
];

quizOption = new QuizOptions();
resourcesPanel = new Resources(resourcesList);
scorePanel = undefined;


var medalSelected = global.medalSelected
medal = new Medal(
	16,
	32,
	medalSelected.name,
	medalSelected.value,
	medalSelected.total,
	medalSelected.id,
	medalSelected.description,
	[],
	false
);



#macro RESOURCES oGuiQuiz.resourcesPanel
#macro RESULTS oGuiQuiz.scorePanel
#macro MEDAL oGuiQuiz.medal




