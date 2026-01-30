extends Control

@onready var computer_button: Button = $ComputerButton
@onready var weatherman: VideoStreamPlayer = $Weatherman
#@onready var color_rect: ColorRect = $ColorRect
#@onready var label_day: Label = $Day_Counter <- don't delete
#@onready var save_button: Button = $Save_Button
var frame = -1;
func _process(delta: float) -> void: #will fix this later
	frame+=1
	#Constructors
	#save_button.text = "Save"
	#test

	#print(local_mouse_pos)
	#print(position.x)
	
	
	#save_button.pressed.connect(_Save)
	#checks when button is pressed and fires signal to _Save to run
	if frame%200==0:
		weatherman.play()
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
