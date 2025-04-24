extends Node3D

@onready var intro_label: Label = $IntroLabel
@onready var intro_timer: Timer = $IntroTimer
@onready var pause_menu: Control = $PauseMenu

func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	DisplayServer.window_is_focused(true)
	intro_label.visible = true
	intro_timer.timeout.connect(_hide_intro_message)

func _hide_intro_message():
	intro_label.visible = false

func _input(event):
	if event.is_action_pressed("fullscreen_toggle"):
		var is_fullscreen = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED if is_fullscreen else DisplayServer.WINDOW_MODE_FULLSCREEN)
