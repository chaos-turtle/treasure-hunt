extends Node

var total_coins: int = 0
var collected_coins: int = 0
var time_left: int = 300
var total_time: int = 0

@onready var ui_label: Label = $"../UI/Control/CoinLabel"
@onready var timer_label: Label = $"../UI/Control/TimerLabel"
@onready var countdown_timer: Timer = $"../Timer"
@onready var coin_sound: AudioStreamPlayer = $PickupSound

func _ready():
	var coins = get_tree().get_nodes_in_group("coins")
	total_coins = get_tree().get_nodes_in_group("coins").size()
	
	countdown_timer.wait_time = 1.0
	countdown_timer.start()
	countdown_timer.timeout.connect(_on_timer_timeout)
	
	for coin in coins:
		coin.collected.connect(_on_coin_collected)
	
	update_ui()

func update_ui():
	ui_label.text = str("Coins found: ", collected_coins, " / ", total_coins)
	timer_label.text = "Time: " + str(time_left)

func _on_coin_collected():
	coin_sound.play()
	collected_coins += 1
	update_ui()

func _on_timer_timeout():
	time_left -= 1
	total_time += 1
	Global.time_taken = total_time
	update_ui()
	
	if time_left <= 0:
		game_over()

func game_over():
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")
