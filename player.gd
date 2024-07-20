extends CharacterBody2D

@onready var ray_cast_2d = $RayCast2D

var grid_scale = 16
var direction_map = {
	"ui_up": Vector2(0, -1) * grid_scale,
	"ui_right": Vector2(1, 0) * grid_scale,
	"ui_down": Vector2(0, 1) * grid_scale,
	"ui_left": Vector2(-1, 0) * grid_scale,
}

func _unhandled_key_input(event):
	for dir in direction_map.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir: String):
	var vector = direction_map[dir]
	ray_cast_2d.target_position = vector
	ray_cast_2d.force_raycast_update()
	#var collider = ray_cast_2d.get_collider()
	#if collider.
	if not ray_cast_2d.is_colliding():
		position += vector
