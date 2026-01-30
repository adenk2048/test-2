extends Control

@onready var display_money: Label = $Money
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_money.text = "Congrats!" + " You ended with $" + str(MoneyAndStocks.money)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
