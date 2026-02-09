extends Control
@onready var sugar_button: Button = $BuySugar
@onready var coffee_button: Button = $BuyCoffee
@onready var fifty_button: Button = $BuyFifty
@onready var back_button: Button = $BackButton
@onready var label: Label = $Label
@onready var label2: Label = $Label2
@onready var label3: Label = $Label3
@onready var moneylabel: Label = $Money
var sugar = 0
var coffee = 0
var fiftyhourenergy = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sugar_button.visible = false
	coffee_button.visible = false
	fifty_button.visible = false
	back_button.visible = false
	label.visible = false
	label2.visible = false
	label3.visible = false
	moneylabel.text = "Money: $" + str(MoneyAndStocks.money)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	moneylabel.text = "$" + str(MoneyAndStocks.money)
	var current_scene := get_tree().current_scene
	if(current_scene and current_scene.name == "@Node2D@8"):
		sugar_button.visible = true
		coffee_button.visible = true
		fifty_button.visible = true
		back_button.visible = true
		label.visible = true
		label2.visible = true
		label3.visible = true
		sugar_button.pressed.connect(_buysugar)
		coffee_button.pressed.connect(_buycoffee)
		fifty_button.pressed.connect(_buyfifty)
		back_button.pressed.connect(_back)
	else:
		sugar_button.visible = false
		coffee_button.visible = false
		fifty_button.visible = false
		back_button.visible = false
		label.visible = false
		label2.visible = false
		label3.visible = false
	pass
	
func _buysugar():
	if (MoneyAndStocks.money - 5 < 0):
		print("You're broke bruh")
	else:
		print("bought sugar")
		MoneyAndStocks.money -= 5

func _buycoffee():
	if (MoneyAndStocks.money - 10 < 0):
		print("You're broke bruh")
	else:
		print("bought coffee")
		MoneyAndStocks.money -= 10

func _buyfifty():
	if (MoneyAndStocks.money - 50 < 0):
		print("You're broke bruh")
	else:
		print("bought 50 hour energy")
		MoneyAndStocks.money -= 50

func _back():
	get_tree().change_scene_to_file("res://robin_good_home.tscn")
