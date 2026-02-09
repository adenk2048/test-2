extends Node
var money = 500
var stocks = []
var names = []
var stockEvents = []
var currentStock = 0
var news = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	#this doesn't work rn
	#we already have data from running it in VSCode so fix as last priority
	#OS.execute("C:\\Users\\willi\\Downloads\\drive-download-20260205T155341Z-1-001\\stock_object_2.exe", [], [], false)
	names.resize(24)
	stocks.resize(24);
	for i in range(24):
		stocks[i]=0
		names[i] = ""
	var events = FileAccess.open("res://data/data.txt", FileAccess.READ).get_as_text()
	news = FileAccess.open("res://data/headlines.txt", FileAccess.READ).get_as_text()
	var TempNames = FileAccess.open("res://data/stock_name.txt", FileAccess.READ).get_as_text()
	news = news.split("\n")
	#var events = FileAccess.open("C:\\Users\\justinahn\\Downloads\\drive-download-20260206T020935Z-1-001\\event_name.txt", FileAccess.READ).get_as_text()
	#var news = FileAccess.open("C:\\Users\\justinahn\\Downloads/drive-download-20260206T020935Z-1-001\\headlines.txt", FileAccess.READ).get_as_text()
	#var TempNames = FileAccess.open("C:\\Users\\justinahn\\Downloads\\drive-download-20260206T020935Z-1-001\\stock_name.txt", FileAccess.READ).get_as_text()
	for i in range (24):
		names[i] = (TempNames.split("\n")[i])
		names[i] = names[i].trim_suffix("\r")
	#740 lines
	#24 data points each
	var lines = events.split("\n")
	for i in range (740):
		lines[i] = lines[i].trim_suffix(" \r")
	
	for i in range (740):
		stockEvents.append([])
		var words = lines[i].split(" ")
		for e in range (24):
			stockEvents[i].append(words[e])
	pass
	#gets the data in a 24x740 2d array.
	#each [i][e] is a singular stock point
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
