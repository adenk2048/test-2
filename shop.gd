extends Control
@onready var sugar_button: Button = $BuySugar
@onready var coffee_button: Button = $BuyCoffee
@onready var fifty_button: Button = $BuyFifty
@onready var back_button: Button = $BackButton

var sugar = 0
var coffee = 0
var fiftyhourenergy = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sugar_button.pressed.connect(_buysugar)
	coffee_button.pressed.connect(_buycoffee)
	fifty_button.pressed.connect(_buyfifty)
	back_button.pressed.connect(_back)
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
