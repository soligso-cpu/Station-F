extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_client_button_up() -> void:
	NetworkHandler.start_client()


func _on_server_button_up() -> void:
	NetworkHandler.start_server()
