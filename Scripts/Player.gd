extends CharacterBody2D


const SPEED = 3
signal player_shoot (player: CharacterBody2D, dir: Vector2)
var can_shoot = true
var velocity_decrease = 1
var direction_bounce_set = false
var direction = global_position.direction_to(get_global_mouse_position())
enum current_room {
	STARTING_ROOM,
	WING_1,
	WING_2,
	MEDBAY,
	HALLWAY
}

func _physics_process(delta: float) -> void:
	for Area2D in $Area2D.get_overlapping_areas():
		if Area2D.name == "StartingRoom":
			$"..".room = current_room.STARTING_ROOM
		if Area2D.name == "Wing1":
			$"..".room = current_room.WING_1
		if Area2D.name == "Wing2":
			$"..".room = current_room.WING_2
		if Area2D.name == "MedicalRoom":
			$"..".room = current_room.MEDBAY
			
	if Input.is_action_just_pressed("Shoot"):
		velocity_decrease = 0.98
		print("pew pew")
		if direction_bounce_set == false:
			direction = global_position.direction_to(get_global_mouse_position())
		print(direction)
		velocity = direction * -SPEED
		$CooldownTimer.start()
		can_shoot = false
		player_shoot.emit(self, direction)
		#direction_bounce_set = false
	velocity = velocity * velocity_decrease
	move_and_collide(velocity)
	rotation = global_position.direction_to(get_global_mouse_position()).angle()

	
func _on_cooldown_timer_timeout() -> void:
	can_shoot = true

#NOTE FOR NEXT TIME
#I want the bouncing off the walls to chnage the angle the player moves
#at, but i hvae no clue how. work that out 

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "TileMapLayer":
		#print("boing boing", body.name)
		velocity = -velocity 
		
		velocity_decrease = 0.97
	elif (body.name == "PlayerBullet"):
		#print("THIS IS IT")
		pass
	#direction_bounce_set = true
	#direction = global_position.direction_to(get_global_mouse_position()) 
