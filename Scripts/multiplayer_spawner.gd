extends MultiplayerSpawner
@export var network_player: PackedScene
@onready var camera_2d: Camera2D = $"../Camera2D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	multiplayer.peer_connected.connect(spawn_player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_player(id: int):
	if not multiplayer.is_server(): return
	
	var player: Node = network_player.instantiate()
	player.name = str(id)
	
	get_node(spawn_path).call_deferred('add_child', player)
	
	


func _on_spawned(node: Node) -> void:
	if node.is_multiplayer_authority():
		camera_2d.target = node
