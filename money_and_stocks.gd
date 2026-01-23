extends Node
var money = 0
var stocks = []




# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	#bro why is this so annoying
	stocks.resize(24);
	for i in range(24):
		stocks[i]=0
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
