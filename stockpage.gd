extends Control

@onready var home_button: Button = $Home
@onready var industry1_button: Button = $Industry1
@onready var industry2_button: Button = $Industry2
@onready var industry3_button: Button = $Industry3
@onready var buy_button: Button = $Buy
@onready var sell_button: Button = $Sell
@onready var stock_input: LineEdit = $NumberOfStocks
@onready var money_value: Label = $Money
var currentStock = 0;
var stockCost = 10;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	money_value.text = "$" + str(MoneyAndStocks.money)
	home_button.pressed.connect(_gotohome)
	industry1_button.pressed.connect(_gotoindustry1)
	industry2_button.pressed.connect(_gotoindustry2)
	industry3_button.pressed.connect(_gotoindustry3)
	buy_button.pressed.connect(_buy)
	sell_button.pressed.connect(_sell)
	
	pass
	
func _gotohome():
	get_tree().change_scene_to_file("res://test2.tscn")
func _gotoindustry1():
	get_tree().change_scene_to_file("res://Stocks1.tscn")
func _gotoindustry2():
	get_tree().change_scene_to_file("res://Stocks2.tscn")
func _gotoindustry3(): 
	get_tree().change_scene_to_file("res://Stocks3.tscn")
func _buy(): 
	print(stock_input.text)
	print("bought " + stock_input.text + " stocks")
	MoneyAndStocks.stocks[currentStock]+=int(stock_input.text)
	if !stock_input.text == "":
		MoneyAndStocks.money-=stockCost*int(stock_input.text)
	print("You now have " + str(MoneyAndStocks.stocks[currentStock]) + " stocks")
func _sell():
	print(stock_input.text)
	print("sold " + stock_input.text + " stocks")
	MoneyAndStocks.stocks[currentStock]-=int(stock_input.text)
	if !stock_input.text == "":
		MoneyAndStocks.money+=stockCost*int(stock_input.text)
	print("You now have " + str(MoneyAndStocks.stocks[currentStock]) + " stocks")
	
