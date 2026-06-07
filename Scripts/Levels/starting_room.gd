extends Area2D
var hits_left = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hits_left <= 0:
		print("EXPLODE")
	
func take_damage():
	hits_left -= 1
	print(hits_left, "on room")




#having issues with area2ds 
#colliding with other area2ds.
#try make it just a collisionshape2d
#and hope
func _on_player_bullet_break_wall(bullet) -> void:
	print("okay")
	take_damage()


func _on_level_1_wall_break() -> void:
	for body in $".".get_overlapping_bodies():
		if body.name == "PlayerBullet":
			take_damage()
