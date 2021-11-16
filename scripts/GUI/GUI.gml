
function GUI(){
	speed = 50;
	glow = false;
	name = "GUI"
	drawGui = true;
	instance = undefined;
	elements = [];
	width = 100
	height = 100
	wrapper = undefined;
	open = true;
	disable = false;
	dragable = false;
	x = 0
	y = 0
	
	initX = 0;
	initY = 0;
	endX = 0;
	endY = 0;
	
	static alarm_0 = function(){}
			
	static create = function(){
		instance = instance_create_depth(x,y,100,oGuiController);
		instance.gui = self;
		instance.elements = elements;
		instance.drawGui = drawGui;
		if(wrapper) array_insert(elements,0,new Wrapper(x,y,width,height,wrapper))
	}	
	
	
	//STEP
	static step = function(){
		x = instance.x
		y = instance.y
		
		var startX = x
		var startY = y
		
		if(open){
			if(instance.x < endX) instance.x+= speed;
			if(instance.y < endY) instance.y+= speed;
		}else{
			if(instance.x > initX) instance.x -= speed
			if(instance.y > initY) instance.y -= speed
		}
		
		if(!disable){
			for(var i = 0; i < array_length(elements); i++){
				elements[i].step();	
			}
		}
		
		for(var i = 0; i < array_length(elements); i++){
			elements[i].x = (elements[i].x + instance.x) - startX ; 
			elements[i].y =  (elements[i].y + instance.y) - startY ; 
		}
		
		
		
	}
	static extra_step = function(){
		
	}
	
	//DRAW
	static draw = function(){
		for(var i = 0; i < array_length(elements); i++){
			elements[i].draw();	
		}
	}
	static extra_draw = function(){}
	
	//DESTROY
	static destroy = function(){
		print("GUI DESTROY",name)
		instance_destroy(instance)
	}
	
	static clean_elements = function(){
		for(var i = 0; i < array_length(elements); i++){
			elements[i].destroy()	
		}
		elements = [];
	}

}