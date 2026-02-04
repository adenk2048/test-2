extends Node2D
@onready var sugar : Sprite2D = $Sugar
@onready var coffee : Sprite2D = $Coffee
@onready var energy : Sprite2D = $FiftyHourEnergy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sugar.visible = false
	coffee.visible = false
	energy.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var current_scene := get_tree().current_scene
	if(current_scene and current_scene.name == "@Node2D@8"):
		sugar.visible = true
		coffee.visible = true
		energy.visible = true
	else:
		sugar.visible = false
		coffee.visible = false
		energy.visible = false
	pass
