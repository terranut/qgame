/// @description
global.debug = false;
//GENERAL SETTINGS
global.settings = readJson("settings.json");

//TRANSLATES
global.displayValues = readJson(global.settings.lang + ".json");

//LOADING
global.showLoading = false;

//FONTS
global.font_gold = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!?,.abcdefghijklmnopqrstuvwxyzáéíóúñ",true,2);
global.font_classic = font_add_sprite_ext(spr_font_2,"ABCDEFGHIJKLMNÑOPQRSTUVWXYZ1234567890-+*/=()#@¡!¿?.,:`$abcdefghijklmnñopqrstuvwxyz",true,2);
global.font_classic_margin = font_add_sprite_ext(spr_font_2_margin,"ABCDEFGHIJKLMNÑOPQRSTUVWXYZ1234567890-+*/=()#@¡!¿?.,:`$abcdefghijklmnñopqrstuvwxyz",true,2);

global.font_ruthenia = font_add_sprite_ext(spr_font_ru,"ABCDEFGHIJKLMNOPQRSTUVWXYZ",true,2);
global.font_title = font_add_sprite_ext(spr_font_title,"ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789ÁÉÍÓÚ",true,2);
global.font_title_mini = font_add_sprite_ext(spr_font_title_mini,"ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789ÁÉÍÓÚ",true,2);
#region COLORS

	#macro YELLOW make_colour_rgb (247, 236, 155)
	
	global.color_brown = make_colour_rgb (136, 92, 60);
	global.color_darkgreen = make_colour_rgb (0, 107, 69);
	global.color_darkblue = make_colour_rgb (16, 24, 32);
	global.color_black = make_colour_rgb (63, 56, 81);
	global.color_orange = make_colour_rgb (210, 125, 44);
	global.color_yellow = make_colour_rgb (247, 236, 155);
	global.color_darkgrey = make_colour_rgb (78, 74, 78);
	global.color_red = make_colour_rgb (220, 73, 73);
	global.color_green = make_colour_rgb (79, 189, 101);
	global.color_blue = make_colour_rgb (102, 162, 216);
	global.color_purple = make_colour_rgb (102, 162, 216);
#endregion



currentSequence = undefined;

global.medalSelected = undefined;
global.font_talker = font_m5
global.glow = 0;
