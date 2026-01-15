extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _input(event):		
	#just to visibly show player input
	if event is InputEventMouseButton:
		if event.pressed:
			get_tree().change_scene_to_file("res://Laptop.tscn")
