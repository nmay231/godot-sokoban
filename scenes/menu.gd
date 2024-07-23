extends Node

@export var levels: Array[Level] = []

func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed():
	get_tree().change_scene_to_packed(levels[1].scene)

func _on_quit_button_pressed():
	get_tree().quit(0)
