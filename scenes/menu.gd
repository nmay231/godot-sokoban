extends Node

@export var levels: Array[Level] = []
@onready var menu = $"."
@onready var level_viewer = $LevelViewer

func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed():
	# $LevelViewer.add_child(levels[1].scene.instantiate())
	var loader = LevelLoader.new()
	# print(loader)
	loader.level = levels[1]
	add_sibling(loader)
	get_parent().remove_child(self)
	# get_tree().change_scene_to_packed(loader)

func _on_quit_button_pressed():
	get_tree().quit(0)
