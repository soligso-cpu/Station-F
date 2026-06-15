extends CanvasLayer


#Using this to store room name ideas
# upper wing/lower wing
# engine room for starting room, cockpit for ending room
# living quarters, captians room, maybe a viewing deck?
# kitchen/galley, lab, medical room
#empty armoury, have the player say somethign about these areas
# used to be the meeting area, but is now a graveyard where our
#sole survivor put the belongings of his ded friends. 
#hail mary style
#escape pods that have all been shot off, a room thats super fragile and seems to have 
#been damaged by something before the player got here
#ELECTRICTY ROOM THAT LETS U TURN ON THE LIGHTS
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if $"../..".room == $"../..".current_room.STARTING_ROOM:
		$Control/HBoxContainer/Label.text = str("Engine room")
	elif  $"../..".room == $"../..".current_room.WING_1:
		$Control/HBoxContainer/Label.text = str("Galley")
	elif  $"../..".room == $"../..".current_room.WING_2:
		$Control/HBoxContainer/Label.text = str("Upper wing")
	elif  $"../..".room == $"../..".current_room.MEDBAY:
		$Control/HBoxContainer/Label.text = str("Medical Room")
	elif  $"../..".room == $"../..".current_room.ARMORY:
		$Control/HBoxContainer/Label.text = str("Armoury")
	elif  $"../..".room == $"../..".current_room.WORKSHOP:
		$Control/HBoxContainer/Label.text = str("Workshop")
	elif  $"../..".room == $"../..".current_room.LIVING_ROOM:
		$Control/HBoxContainer/Label.text = str("Living room")
	elif  $"../..".room == $"../..".current_room.MEETING_ROOM:
		$Control/HBoxContainer/Label.text = str("Meeting Room")
	elif  $"../..".room == $"../..".current_room.BED_1:
		$Control/HBoxContainer/Label.text = str("Jason's room")
		
		
		
	#there is defintley a better way to do this, and i intend to optimize it down the line
	#for now, this will  do.
	
	#and if your looking in my files after i've submitted this then
	#uh
	#dang
