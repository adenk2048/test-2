extends Control
#rename all the industrybutton names for the actual industry names
@onready var button_industry1: Button = $Industry1
@onready var button_industry2: Button = $Industry2
@onready var button_industry3: Button = $Industry3
@onready var home_button: Button = $HomeButton
@onready var stock_button1: Button = $StockButton1
@onready var stock_button2: Button = $StockButton2
@onready var stock_button3: Button = $StockButton3
@onready var stock_button4: Button = $StockButton4
@onready var stock_button5: Button = $StockButton5
@onready var stock_button6: Button = $StockButton6
@onready var stock_button7: Button = $StockButton7
@onready var stock_button8: Button = $StockButton8
@onready var shop: Button = $Shop
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	button_industry1.pressed.connect(_gotoindustry1)
	button_industry2.pressed.connect(_gotoindustry2)
	button_industry3.pressed.connect(_gotoindustry3)
	home_button.pressed.connect(_gotohome)
	shop.pressed.connect(_gotoshop)
	stock_button1.pressed.connect(_gotostock1)
	stock_button2.pressed.connect(_gotostock2)
	stock_button3.pressed.connect(_gotostock3)
	stock_button4.pressed.connect(_gotostock4)
	stock_button5.pressed.connect(_gotostock5)
	stock_button6.pressed.connect(_gotostock6)
	stock_button7.pressed.connect(_gotostock7)
	stock_button8.pressed.connect(_gotostock8)
	pass
	
	
func _gotoindustry1(): #rename this to goto[industryname]
	get_tree().change_scene_to_file("res://Stocks1.tscn")
func _gotoindustry2(): #rename this to goto[industryname]
	get_tree().change_scene_to_file("res://Stocks2.tscn")
func _gotoindustry3(): #rename this to goto[industryname]
	get_tree().change_scene_to_file("res://Stocks3.tscn")
func _gotohome(): 
	get_tree().change_scene_to_file("res://robin_good_home.tscn")
	
func _gotostock1():
	MoneyAndStocks.currentStock = 16
	get_tree().change_scene_to_file("res://stock_page.tscn")
func _gotostock2(): 
	MoneyAndStocks.currentStock = 17
	get_tree().change_scene_to_file("res://stock_page.tscn")
	
func _gotostock3(): 
	MoneyAndStocks.currentStock = 18
	get_tree().change_scene_to_file("res://stock_page.tscn")
	
func _gotostock4(): 
	MoneyAndStocks.currentStock = 19
	get_tree().change_scene_to_file("res://stock_page.tscn")
	
func _gotostock5(): 
	MoneyAndStocks.currentStock = 20
	get_tree().change_scene_to_file("res://stock_page.tscn")
	
func _gotostock6(): 
	MoneyAndStocks.currentStock = 21
	get_tree().change_scene_to_file("res://stock_page.tscn")	
	
func _gotostock7(): 
	MoneyAndStocks.currentStock = 22
	get_tree().change_scene_to_file("res://stock_page.tscn")
	
func _gotostock8(): 
	MoneyAndStocks.currentStock = 23
	get_tree().change_scene_to_file("res://stock_page.tscn")
	
	
func _gotoshop():
	get_tree().change_scene_to_file("res://shop.tscn")
