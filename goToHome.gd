extends Control
#rename all the industrybutton names for the actual industry names
@onready var button_industry1: Button = $Industry1
@onready var button_industry2: Button = $Industry2
@onready var button_industry3: Button = $Industry3
@onready var home_button: Button = $HomeButton
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	button_industry1.pressed.connect(_gotoindustry1)
	button_industry2.pressed.connect(_gotoindustry2)
	button_industry3.pressed.connect(_gotoindustry3)
	home_button.pressed.connect(_gotohome)
	pass
	
	
func _gotoindustry1(): #rename this to goto[industryname]
	get_tree().change_scene_to_file("res://Stocks1.tscn")
func _gotoindustry2(): #rename this to goto[industryname]
	get_tree().change_scene_to_file("res://Stocks2.tscn")
func _gotoindustry3(): #rename this to goto[industryname]
	get_tree().change_scene_to_file("res://Stocks3.tscn")
func _gotohome(): 
	get_tree().change_scene_to_file("res://robin_good_home.tscn")
