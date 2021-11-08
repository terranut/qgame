
function GUI(){
	drawGui = true;
	instance = undefined;
	elements = [];
	width = 100
	height = 100
	wrapper = undefined;
	x = 0
	y = 0
			
	static create = function(){
		instance = instance_create_depth(x,y,100,oGuiController);
		instance.gui = self;
		instance.elements = elements;
		instance.drawGui = drawGui;
		if(wrapper) array_insert(elements,0,new Wrapper(x,y,width,height,wrapper))
	}	
	
	
	//STEP
	static step = function(){
		for(var i = 0; i < array_length(elements); i++){
			elements[i].step();	
		}
	}
	static extra_step = function(){}
	
	//DRAW
	static draw = function(){
		for(var i = 0; i < array_length(elements); i++){
			elements[i].draw();	
		}
	}
	static extra_draw = function(){}
	
	//DESTROY
	static destroy = function(){
		instance_destroy(instance)
	}

}