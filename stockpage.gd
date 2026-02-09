extends Control

@onready var home_button: Button = $Home
@onready var industry1_button: Button = $Industry1
@onready var industry2_button: Button = $Industry2
@onready var industry3_button: Button = $Industry3
@onready var buy_button: Button = $Buy
@onready var sell_button: Button = $Sell
@onready var stock_input: LineEdit = $NumberOfStocks
@onready var money_value: Label = $Money
@onready var graph2d: Graph2D = $Graph2D
@onready var stock_name: Label = $StockName

var plot
var stockCost = MoneyAndStocks.stockEvents[((Hud.day-1)*24) + Hud.time + 20][MoneyAndStocks.currentStock];
var lastx = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	plot = graph2d.add_plot_item(str(MoneyAndStocks.names[MoneyAndStocks.currentStock]), Color.WHITE, 3.0)
	stock_name.text = str(MoneyAndStocks.names[MoneyAndStocks.currentStock])
	updateGraph()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var currentx = int(((Hud.day-1)*24) + Hud.time)
	
	if(currentx !=lastx):
		graph2d.x_min = currentx
		graph2d.x_max = currentx + 18
		lastx = currentx
	
	var min = 99999
	var max = -99999
	for i in range(((Hud.day-1)*24) + Hud.time, ((Hud.day-1)*24) + Hud.time + 20, 1):
		var val = float(MoneyAndStocks.stockEvents[i][MoneyAndStocks.currentStock])
		if(min>val):
			min = val
		if(max<val):
			max = val
	stockCost = MoneyAndStocks.stockEvents[int(((Hud.day-1)*24) + Hud.time + 18)][MoneyAndStocks.currentStock]
	graph2d.y_min = min-100
	graph2d.y_max = max+100
	money_value.text = "$" + str(MoneyAndStocks.money)
	
	if(Hud.time-int(Hud.time)<0.001):
		updateGraph()
	#DELAY THE STOCKS BY 10 SECONDS
	#update the stocks the hour AFTER the event happens
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
	if !stock_input.text == "":
		if(MoneyAndStocks.money-int(stockCost)*int(stock_input.text)<0):
			print("you're broke")
		else:
			MoneyAndStocks.stocks[MoneyAndStocks.currentStock]+=int(stock_input.text)
			MoneyAndStocks.money-=int(stockCost)*int(stock_input.text)
	print("You now have " + str(MoneyAndStocks.stocks[MoneyAndStocks.currentStock]) + " stocks")
func _sell():
	if !stock_input.text == "":
		if(MoneyAndStocks.stocks[MoneyAndStocks.currentStock]-int(stock_input.text)<0):
			print("you're broke")
		else:
			MoneyAndStocks.stocks[MoneyAndStocks.currentStock]-=int(stock_input.text)
			MoneyAndStocks.money+=int(stockCost)*int(stock_input.text)
	print("You now have " + str(MoneyAndStocks.stocks[MoneyAndStocks.currentStock]) + " stocks")
	
func updateGraph():
	plot.remove_all()
	for x in range (int(((Hud.day-1)*24) + Hud.time), int(((Hud.day-1)*24) + Hud.time + 19), 1):
		plot.add_point(Vector2(float(x), float(MoneyAndStocks.stockEvents[x][MoneyAndStocks.currentStock])))
