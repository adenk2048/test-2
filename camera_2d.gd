extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#position.x += 1
	var local_mouse_pos = get_local_mouse_position()
	if local_mouse_pos.x>570: 
		position.x-=1
	if local_mouse_pos.x<-570: 
		position.x+=1
	pass
	#guys i got it to work :l
	#another test just in case
