extends Node

@export var levels: Array[Level] = []
@onready var menu = $"."
@onready var level_viewer = $LevelViewer

func _ready():
	# Surely, there's a better way to do this?
	Globals.levels = levels
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed():
	var loader = LevelLoader.new()
	#loader.level = levels[1]
	loader.level_index = 5
	add_sibling(loader)
	get_parent().remove_child(self)

func _on_quit_button_pressed():
	get_tree().quit(0)
