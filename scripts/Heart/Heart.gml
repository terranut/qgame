
function Heart(_xStart,_yStart,_xDestination,_yDestination) constructor{
	x = _xStart;
	y = _yStart;
	sprite = spr_heart;
	xScale = 1;
	yScale = 1;
	destination = {x:_xDestination,y:_yDestination};

	
	
	create();
	static create = function(){
		print("CREATE HEART",x,y,"Destino",destination)
		instance = instance_create_depth(x,y,9,oItem);
		instance.item = self;
		instance.sprite_index = sprite;
		instance.image_xscale = xScale;
		instance.image_speed = yScale;
		
		instance.direction = point_direction(x,y,destination.x,destination.y);
		if(point_distance(instance.x,instance.y,destination.x,destination.y) > 200) instance.speed = 4;
		else instance.speed = 2;
		state = arriving;
		
	}
	
	static draw = function(){
		draw_sprite(instance.sprite_index,0,instance.x,instance.y)
	}
	static step = function(){
		state();
	}
	
	#region STATE
		static waiting = function(){}
		
		static arriving = function(){
			if(point_distance(instance.x,instance.y,destination.x,destination.y) < 5){
				instance.speed = 0;
				destroy();
			}
		}
		
	#endregion
	
	
	
	static animation_end = function(){}
	static destroy = function(){
		instance_destroy(instance)
	}
	
}