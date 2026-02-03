extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect
@onready var transition: AnimationPlayer = $AnimationPlayer

signal transition_finished
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.visible = false
	pass # Replace with function body.
	
func _process(delta: float) -> void:
	transition.animation_finished.connect(toNormal)
	
func toNormal(anim_name):
	print(anim_name)
	if(anim_name == "fade_to_black"):
		transition.play("fade_to_normal")
		transition_finished.emit()
	elif(anim_name == "fade_to_normal"):
		color_rect.visible = false;
		
func toBlack():
	color_rect.visible = true
	transition.play("fade_to_black")
