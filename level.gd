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

@export var wall_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var wall = wall_scene.instantiate()
	#wall.position = 
	#wall.position = Vector2(self.width / 2, self.height / 2)
	add_child(wall)
	#var wall = $Wall.
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
