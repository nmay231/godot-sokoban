class_name LevelLoader
extends Node2D

#@export var level: Level
@export var level_index: int
var level: Level
var level_node: Node
var tile_map: TileMap
var blocks: Array[Node]
var goal_hash: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	level = Globals.levels[level_index]
	level_node = level.scene.instantiate()
	add_child(level_node)
	get_window().content_scale_factor = 60.0 / level.size.x

	tile_map = level_node.get_node("TileMap")
	for child in level_node.get_children():
		# Could probably have a better duck-type thing using has_method, but I
		# don't care right now.
		if child is Block:
			blocks.push_back(child)

	for goal in level.goal_positions:
		goal_hash[goal] = true

func _unhandled_key_input(event):
	if not event.is_action_type():
		return
	var block_hash = {}
	for block in blocks:
		block_hash[Vector2i(tile_map.local_to_map(to_local(block.position)))] = true

	for goal in level.goal_positions:
		if !block_hash.has(goal):
			return

	var loader = LevelLoader.new()
	loader.level_index = level_index + 1
	add_sibling(loader)
	get_parent().remove_child(self)
