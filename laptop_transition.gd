extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect
@onready var transition: AnimationPlayer = $AnimationPlayer

signal transition_finished
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.visible = false
	transition.animation_finished.connect(toNormal)
	pass # Replace with function body.
	
func toNormal(anim_name):
	if(anim_name == "laptop"):
		color_rect.visible = false
		transition_finished.emit()
	else:
		color_rect.visible = false
func Laptop():
	color_rect.visible = true
	transition.play("laptop")
