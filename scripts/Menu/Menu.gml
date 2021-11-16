
function Menu():GUI() constructor{
	name = "Menu";
	drawGui = true;
	
	width = 150;
	height = 160
	open = false;
	wrapper = undefined
	dragable = false;
	
	x = (display_get_gui_width()/2) - (width/2)
	y = -500

	initX = x;
	initY = y;
	endX = (display_get_gui_width()/2) - (width/2)
	endY = (display_get_gui_height()/2) - (height/2)


	
	view_default();
	create();
	
	
	static view_default = function(){
		elements = [];
		width = 150;
		height = 160;
		
		wrapperMenu = new Wrapper(x,y,width,height,spr_wrapper_9)
		resume = new TextButton("Resume",x,y+12,function(){
			toggle_menu()
		})
		resume.x = resume.x + (width/2)-(resume.width/2);

		options = new TextButton("Options",x,y+46,function(){ view_options()})
		options.x = options.x + (width/2)-(options.width/2)

		title = new TextButton("Title screen",x,y+80,function(){room_goto(Main)});
		title.x = title.x + (width/2)-(title.width/2)

		quit = new TextButton("Quit",x,y+115,function(){game_end()})
		quit.x = quit.x + (width/2)-(quit.width/2)
		elements = [wrapperMenu,resume,options,title,quit];
		
	}
	
	static view_options = function(){
		
		width = 200;
		height = 250;
		x = (display_get_gui_width()/2) - (width/2)
		y = (display_get_gui_height()/2) - (height/2)


		wrapper = new Wrapper(x,y,width,height,spr_wrapper_9)
		
		
		elements = []
		fullScreen = new Checkbox(x+16,y+48,"Full screen",window_get_fullscreen(),function(){
			window_set_fullscreen(!window_get_fullscreen());
			DATA.savePreferences()
			return window_get_fullscreen()
		});
		
		font = new Checkbox(x+16,y+70,"Font classic",(global.font_talker == global.font_classic_margin),function(){
				if(global.font_talker == font_m5) global.font_talker = global.font_classic_margin;
				else global.font_talker = font_m5;
				DATA.savePreferences()
				return (global.font_talker == global.font_classic_margin)
		});

		glow = new Checkbox(x+16,y+92,"Glow",global.glow,function(){
				global.glow = !global.glow
				DATA.savePreferences()
				return (global.glow)
		});

		back = new TextButton("Back",x,y+height-42,function(){view_default()})
		back.x = back.x + (width/2)-(back.width/2)
		elements = [wrapper,fullScreen,font,glow,back];
	}
	
	
	static extra_step = function(){
		if(keyboard_check_pressed(vk_escape)){
			toggle_menu()
		}
		
		if(keyboard_check_pressed(vk_enter)){
			var noti = new Notification()
		}
		
	}


	static toggle_menu = function(){
		open = !open;
		if(open){
			with(oGuiController) {
				gui.disable = true;
				visible = false				
			}
			instance.visible = true;
			disable = false;
			with(oNpc) npcEnable = false
			
			#region EFFECTS
				var _fx_struct = layer_get_fx("Effects");
				var _params = fx_get_parameters (_fx_struct);
				_params.g_Intensity = 1;
				fx_set_parameters (_fx_struct, _params);
			
				var _fx_struct = layer_get_fx("Effects_blur");
				var _params = fx_get_parameters (_fx_struct);
				_params.g_Radius = 3;
				fx_set_parameters (_fx_struct, _params);
			#endregion
		
		}else{
			with(oGuiController){
				gui.disable = false;
				visible = true	
			}
	
			with(oNpc) npcEnable = true
			
			#region EFFECTS
				var _fx_struct = layer_get_fx("Effects");
				var _params = fx_get_parameters (_fx_struct);
				_params.g_Intensity = 0;
				fx_set_parameters (_fx_struct, _params);
			
				var _fx_struct = layer_get_fx("Effects_blur");
				var _params = fx_get_parameters (_fx_struct);
				_params.g_Radius = 0;
				fx_set_parameters (_fx_struct, _params);
			#endregion
		}
	}
	
}