/// @description 
event_inherited()
xOffset = 30
yOffset = 30

col = make_color_rgb(220,202,190);

skyColor = make_color_rgb(152,203,216);
width = sprite_get_width(sprite_index);
height = sprite_get_height(sprite_index);

clip_surface = surface_create(width-10, height-5);

xx = 0
yy = 0
cloudSpeed = choose(0.06,0.05,0.03,0.04)
maxWidth = choose(35,40,45)

currentCloud1 = {xx:0 ,yy: irandom(45) }
currentCloud2 = {xx:0 ,yy: irandom(45) }