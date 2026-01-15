extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#position.x += 1
	#var local_mouse_pos = get_local_mouse_position()
	#if local_mouse_pos.x>570: 
	#	position.x-=1
	#if local_mouse_pos.x<-570: 
	#	position.x+=1
	#pass
	
	var local_mouse_pos = get_local_mouse_position()
<<<<<<< HEAD
	#print(local_mouse_pos)
	#print(position.x)
	
	if (local_mouse_pos.x > 400 and position.x < 250):
		position.x+=8
	if (local_mouse_pos.x < -400 and position.x > -250):
		position.x-=8
#<<<<<<< HEAD
#=======
#>>>>>>> 5765b53839f9b6d78099af54445ffe8f346efdf7
=======
	if local_mouse_pos.x>570: 
		position.x+=1
	if local_mouse_pos.x<-570: 
		position.x-=1
	pass
	#guys i got it to work :l
	#another test just in case
	#test123
	#hi justin :D
	#hi aiden
>>>>>>> 255add058394192729a643695520cde21cd4615b
