extends Control

@onready var computer_button: Button = $ComputerButton
@onready var color_rect: ColorRect = $ColorRect
#@onready var label_day: Label = $Day_Counter <- don't delete
#@onready var save_button: Button = $Save_Button

var time := 0.0
var day := 1
var money = 0

func _process(delta: float) -> void: #will fix this later
	#Constructors
	#save_button.text = "Save"
	#test
	var local_mouse_pos = get_local_mouse_position()

	#print(local_mouse_pos)
	#print(position.x)
	
#	if (local_mouse_pos.x > 400 and color_rect.position.x < 250):
#		color_rect.position.x-=7
#	if (local_mouse_pos.x < -400 and color_rect.position.x > -250):
#		color_rect.position.x+=7
	
	
	#save_button.pressed.connect(_Save)
	#checks when button is pressed and fires signal to _Save to run
	computer_button.pressed.connect(_Computerbutton)


func _Computerbutton():
	print("The button works")
	#get_tree().change_scene_to_file("res://robin_good_home.tscn")
	get_tree().change_scene_to_file("res://robin_good_home.tscn")
	#label_day.add_theme_color_override("font_color", Color.BLACK)
	#^attempt to change color of text while changing scenes, it didn't work :(
		
#func _Save():
#	var save_nodes = get_tree().get_nodes_in_group("SaveData")
	#print("Button pressed")
	#guys i got it to work... aiden you can chill out now
	#testetsetststetsttesttesttets
	#comment
	#hi aiden
