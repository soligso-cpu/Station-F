extends Node2D

signal wall_break()
const PLAYER_BULLET_SCENE = preload("res://Scenes/player_bullet.tscn")
enum current_room {
	STARTING_ROOM,
	WING_1,
	WING_2,
	MEDBAY,
	HALLWAY
}
var room = current_room.STARTING_ROOM
var starting_room_hits_left = 30
var wing_1_hits_left = 30
var wing_2_hits_left = 30
var damage = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_player_player_shoot(player: CharacterBody2D, dir: Vector2) -> void:
	var bullet = PLAYER_BULLET_SCENE.instantiate()
	$PlayerBullets.add_child(bullet)
	bullet.global_position = player.global_position
	bullet.direction = dir
	wall_break.emit()
	print(room, "is room")




#theres definetley a better way to do this,, but after trail and error
# i sure as hell son't know it
func _on_starting_room_body_entered(body: Node2D) -> void:
	room = current_room.STARTING_ROOM
	print(room)



func _on_starting_room_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		room = current_room.HALLWAY
		print(room)


func _on_wing_1_body_entered(body: Node2D) -> void:
	if body.name == "Player":	
		room = current_room.WING_1
		
		print(room)

func _on_wing_1_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		room = current_room.HALLWAY
		print(room)



func _on_wing_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		room = current_room.WING_2

		print(room)

func _on_wing_2_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		room = current_room.HALLWAY
		print(room)


func _on_wall_break() -> void:
	print("THING")
	if room == 0:
		starting_room_hits_left -= damage
		print("starting room has ", starting_room_hits_left, " hits left")
	elif room == 1:
		wing_1_hits_left -= damage
		print("wing_1 has ", wing_1_hits_left, " hits left")

	elif room == 2:
		wing_2_hits_left -= damage
		print("wing_2 has ", wing_2_hits_left, " hits left")

	else:
		pass


func _on_player_bullet_break_wall(bullet: CharacterBody2D) -> void:
	print("THING")
	if room == 0:
		starting_room_hits_left -= damage
		print("starting room has ", starting_room_hits_left, " hits left")
	elif room == 1:
		wing_1_hits_left -= damage
		print("wing_1 has ", wing_1_hits_left, " hits left")

	elif room == 2:
		wing_2_hits_left -= damage
		print("wing_2 has ", wing_2_hits_left, " hits left")

	else:
		print("welcome to the invinciblle hallway")
