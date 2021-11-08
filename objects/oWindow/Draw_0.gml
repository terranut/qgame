/// @description 

//DRAW SKY
draw_set_color(skyColor)
draw_rectangle(x+5,y+5,x + width-5, y + height-5,0)
resetFont();


//DRAW CLOUDS
if(!surface_exists(clip_surface)) {
    clip_surface = surface_create(width-10, height-5);
}

surface_set_target(clip_surface);
draw_clear_alpha(c_black, 0);

draw_sprite(spr_cloud_1,0,currentCloud1.xx + xx,currentCloud1.yy)
draw_sprite(spr_cloud_2,0,currentCloud2.xx + xx,currentCloud2.yy)

xx = xx+ cloudSpeed;
if(xx > maxWidth){
	xx = -10
	currentCloud1 = {xx:0 ,yy: irandom(45) }
	currentCloud2 = {xx:0 ,yy: irandom(45) }
}

surface_reset_target();
draw_surface(clip_surface, x+5, y+5);


//DRAW FRAME
draw_self();
