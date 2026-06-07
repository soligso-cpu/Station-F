extends TileMapLayer
var hits_left = 10
signal workplz()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func take_damage():
	hits_left -= 1
	print(hits_left)
	workplz.emit()
