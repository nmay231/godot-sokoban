extends Node

@export var grid_scale = 16
@export var direction_map = {
	"ui_up": Vector2(0, -1) * grid_scale,
	"ui_right": Vector2(1, 0) * grid_scale,
	"ui_down": Vector2(0, 1) * grid_scale,
	"ui_left": Vector2(-1, 0) * grid_scale,
}
@export var levels: Array[Level]
