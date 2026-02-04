extends CanvasLayer

@onready var label_clock: Label = $Clock
@onready var label_day: Label = $Day_Counter
@onready var label_energy: Label = $Energy
@onready var sleep_button: Button = $SleepButton
@onready var menu_button: OptionButton = $ItemList
#@onready var label_money: Label = $Money
#@onready var save_button: Button = $Save_Button
var time := 0.0
var day := 1
var money = 0
var energyloss = 0

func _ready() -> void:
	menu_button.item_count = 3
	menu_button.add_item("wow")

func _process(delta: float) -> void:
	#Constructors
	#save_button.text = "Save"
	var current_scene := get_tree().current_scene
	#if current_scene: #for debugging :l
	#	print(current_scene.name)
	#else:
	#	print("nothing yet null instance")
		
		
	time += delta/10
	energyloss += delta / 5
	if(current_scene and current_scene.name == "Start"):
		sleep_button.pressed.connect(Sleep)
		#print(energyloss)
	
		label_clock.text = str(int(round(time))) + ":00"
		label_day.text = "Day " + str(day)
	#label_money.text = "Money: $" + str(money)
		money+=1
		round(money)
		sleep_button.visible = true
		label_clock.visible = true
		label_day.visible = true
		menu_button.visible = true
		label_energy.visible = true
	else:
		label_clock.visible = false
		label_day.visible = false
		sleep_button.visible = false
		menu_button.visible = false
		label_energy.visible = false

	#save_button.pressed.connect(_Save)
	#checks when button is pressed and fires signal to _Save to run

	label_energy.text = "Energy: " + str(round(100-energyloss)) + " / 100"
	
	if time >= 23.9:
		time = 0.0
		day+=1
	if day == 30:
		print("You win bruh")
		get_tree().change_scene_to_file("res://end_scene.tscn")
	
	if round(100-energyloss) <= 0:
		Sleep()
		
func Sleep():
	energyloss-=50
	if(energyloss<0):
		energyloss = 0
	Transition.toBlack()
	await Transition.transition_finished
	print("You mad tired bruh")
	time+=8
#func _Save():
#	var save_nodes = get_tree().get_nodes_in_group("SaveData")
	#print("Button pressed")
	#guys i got it to work... aiden you can chill out now
	#testetsetststetsttesttesttets
	#comment
	#hi aiden
