extends Control

@onready var label_clock: Label = $Clock
#@onready var label_day: Label = $Day_Counter
#@onready var label_money: Label = $Money
#@onready var save_button: Button = $Save_Button

var time := 0.0
var day := 1
var money = 0

func _process(delta: float) -> void:
	#Constructors
	#save_button.text = "Save"
	
	
	time += delta /10
	label_clock.text = str(int(round(time))) + ":00"
	#label_day.text = "Day " + str(day)
	#label_money.text = "Money: $" + str(money)
	money+=1
	round(money)
	#save_button.pressed.connect(_Save)
	#checks when button is pressed and fires signal to _Save to run


	
	if time >= 23.9:
		time = 0.0
		day+=1
	if day == 30:
		print("You win bruh")
		get_tree().quit()
		
#func _Save():
#	var save_nodes = get_tree().get_nodes_in_group("SaveData")
	#print("Button pressed")
	#guys i got it to work... aiden you can chill out now
	#testetsetststetsttesttesttets
	#comment
	
