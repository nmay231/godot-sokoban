extends Node2D

enum CellState {BACKGROUND, WALL, INSIDE, GOAL}

# Only used for quickly defining a puzzle
const B = CellState.BACKGROUND
const W = CellState.WALL
const I = CellState.INSIDE
const G = CellState.GOAL
var grid = [
	[W, W, W, W, W, W, W],
	[W, B, B, B, B, B, W],
	[W, B, B, B, B, B, W],
	[W, B, B, B, B, B, W],
	[W, B, B, B, B, B, W],
	[W, B, B, G, B, B, W],
	[W, W, W, W, W, W, W],
]
var PlayerPos = Vector2(3, 1)
var Blocks = [Vector2(3, 3)]
@onready var tile_map = $TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	print(tile_map)
	print(tile_map.tile_set)
	var t: TileSet = tile_map.tile_set
	#t.layer
	print(tile_map.get_layers_count())
	print(tile_map.get_layer_name(0))
	print(tile_map.tile_set)
	#var rect = get_viewport_rect()
	#var viewport = get_viewport()
	print(get_viewport_rect(), " ", get_viewport_transform(), " ", get_viewport())
	#viewport.width


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
