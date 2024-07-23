class_name Level
extends Resource

enum GridItem {
	Wall,
	EmptyCell,
	Goal,
	Outside,
}

@export var size: Vector2i
@export var grid: Array[GridItem]
@export var player_start: Vector2i
@export var blocks: Array[Vector2i]

