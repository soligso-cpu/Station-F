extends CanvasLayer

var current_room 
var room_1_spoken = false
var room_2_spoken = false
var room_3_spoken = false
var room_4_spoken = false
var room_5_spoken = false
var room_6_spoken = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(current_room)
	if $"../..".room == $"../..".current_room.STARTING_ROOM:
		
		$Control/DialougeBox.text = str("Engine room")
	elif  $"../..".room == $"../..".current_room.WING_1:
		$Control/DialougeBox.text = str("Galley")
	elif  $"../..".room == $"../..".current_room.WING_2:
		$Control/DialougeBox.text = str("Upper wing")
	elif  $"../..".room == $"../..".current_room.MEDBAY:
		$Control/DialougeBox.text = str("Medical Room")
