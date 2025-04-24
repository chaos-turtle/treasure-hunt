extends Node3D

signal collected

@export var rotation_speed: float = 180.0

func _process(delta):
	rotate_y(deg_to_rad(rotation_speed * delta))
	
func _ready():
	add_to_group("coins")
	$Area3D.body_entered.connect(_on_area_3d_body_entered)

func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		collected.emit()
		queue_free()
