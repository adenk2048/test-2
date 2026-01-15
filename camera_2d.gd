extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var local_mouse_pos = get_local_mouse_position()

	#print(local_mouse_pos)
	#print(position.x)
	
	if (local_mouse_pos.x > 400 and position.x < 250):
		position.x+=8
	if (local_mouse_pos.x < -400 and position.x > -250):
		position.x-=8
	pass
