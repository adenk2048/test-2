extends Control
#rename all the industrybutton names for the actual industry names
@onready var button_industry1: Button = $Industry1
@onready var button_industry2: Button = $Industry2
@onready var button_industry3: Button = $Industry3
@onready var button_industry4: Button = $Industry4
@onready var button_industry5: Button = $Industry5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	button_industry1.pressed.connect(_gotoindustry1)
	pass
	
	
func _gotoindustry1(): #rename this to goto[industryname]
	get_tree().change_scene_to_file("res://industriesandstocks.tscn")
