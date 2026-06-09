extends Node2D

var direction = global_position.direction_to(get_global_mouse_position())
var invert = 1
const SPEED = 3
var potential = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = global_position.direction_to(get_global_mouse_position())
	potential = direction * -SPEED

	print(rotation)
	position = $"../Player".global_position
	if $"../Player".cling_state == true:
		rotation = global_position.direction_to(get_global_mouse_position()).angle()
	else:
		rotation = potential.angle()
