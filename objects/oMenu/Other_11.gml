/// @description OPTIONS

width = 200;
height = 250;
x = (display_get_gui_width()/2) - (width/2)
y = (display_get_gui_height()/2) - (height/2)


wrapper = new Wrapper(x,y,width,height,spr_wrapper_9)
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

back = new TextButton("Back",x,y+height-42,function(){event_user(14)})
back.x = back.x + (width/2)-(back.width/2)


elements = [];
array_push(elements,wrapper,fullScreen,font,glow,back)