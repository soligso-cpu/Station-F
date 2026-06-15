extends CanvasLayer

var current_room 
var room_1_spoken = false
var room_2_spoken = false
var room_3_spoken = false
var room_4_spoken = false
var room_5_spoken = false
var room_6_spoken = false
var room_changed = false
var next_text = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(current_room)
	
		
	if room_changed == true: 
		$StartDelay.start()
		room_changed = false
	
	if Input.is_action_just_pressed("Interact") and next_text == true and $Control/DialougeBox.visible == true:
		if $"../..".room == $"../..".current_room.WING_1:
			print("off it")
			$Control/DialougeBox.text = str("or had any food.") 
			next_text = false
		elif  $"../..".room == $"../..".current_room.WING_2 :
			$Control/DialougeBox.text = str("Actually... don't answer that.")
			next_text = false
	elif next_text == false and Input.is_action_just_pressed("Interact"):
		vistoggleoff()

func _on_start_delay_timeout() -> void:
	
	if $"../..".room == $"../..".current_room.STARTING_ROOM and room_1_spoken == false:
		
		$Control/DialougeBox.text = str("That should be everything fixed. Now I just need to get back to the cockpit with the ship in one
		piece.")
		room_1_spoken = true
		vistoggleon()
		
	elif  $"../..".room == $"../..".current_room.WING_1 and room_2_spoken == false:
		$Control/DialougeBox.text = str("If only i knew how to cook.") 
		room_2_spoken = true

		next_text = true
		vistoggleon2()
	elif  $"../..".room == $"../..".current_room.WING_2 and room_3_spoken == false:
		$Control/DialougeBox.text = str("Why do i even bother fixing things when i move aorund with  a literal gun?
		")
		room_3_spoken = true
		next_text = true
		vistoggleon2()
	elif  $"../..".room == $"../..".current_room.MEDBAY and room_4_spoken == false:
		$Control/DialougeBox.text = str("This place gets far too much use these days. In the other stations at least.")
		vistoggleon()
		room_4_spoken = true

		
		
func vistoggleoff():
	print("off")
	$Control/HBoxContainer/TextureRect.visible = false
	$Control/HBoxContainer/TextureRect2.visible = false
	$Control/DialougeBox.visible = false
	$Label.visible = false

func vistoggleon():
	$Control/HBoxContainer/TextureRect.visible = true
	$Control/HBoxContainer/TextureRect2.visible = true
	$Control/DialougeBox.visible = true
	next_text = false
	$Label.visible = true

func vistoggleon2():
	$Control/HBoxContainer/TextureRect.visible = true
	$Control/HBoxContainer/TextureRect2.visible = true
	$Control/DialougeBox.visible = true
	$Label.visible = true

func _on_expire_timer_timeout() -> void:
	vistoggleoff()
