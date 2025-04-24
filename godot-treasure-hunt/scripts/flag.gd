extends Node3D

@onready var coin_manager: Node = $"../CoinManager"
@onready var anim_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_player.play("Object_0")
	$Area3D.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player") and coin_manager.collected_coins == coin_manager.total_coins:
		get_tree().change_scene_to_file("res://scenes/Victory.tscn")
