extends CharacterBody2D

signal break_wall (bullet: CharacterBody2D)

var direction = Vector2.ZERO
const MOVE_SPEED = 200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += (direction * MOVE_SPEED * delta)
	rotation = direction.angle()




	


func _on_bullet_area_body_entered(body: Node2D) -> void:
	print("collision")
	if not (body.name == "Player") and not (body.name == "PlayerBullet"):
		if body.has_method("take_damage"):
			body.take_damage()
			break_wall.emit(self)
			#print(body, "is body")
		print("Should have emitted")
		print(body, "is body")

		queue_free() # Replace with function body.
	print("ENND")
