/// @description DEFAULT

width = 150;
height = 160;
x = (display_get_gui_width()/2) - (width/2)
y = (display_get_gui_height()/2) - (height/2)


wrapper = new Wrapper(x,y,width,height,spr_wrapper_9)
resume = new TextButton("Resume",x,y+12,function(){event_perform(ev_keyrelease,vk_escape)})
resume.x = resume.x + (width/2)-(resume.width/2);

options = new TextButton("Options",x,y+46,function(){event_user(1)})
options.x = options.x + (width/2)-(options.width/2)

title = new TextButton("Title screen",x,y+80,function(){room_goto(Main)});
title.x = title.x + (width/2)-(title.width/2)

quit = new TextButton("Quit",x,y+115,function(){game_end()})
quit.x = quit.x + (width/2)-(quit.width/2)






elements = [];
array_push(elements,wrapper,resume,options,title,quit)