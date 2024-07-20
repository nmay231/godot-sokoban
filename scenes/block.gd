extends RigidBody2D

@onready var ray_cast_2d = $RayCast2D

func can_push(dir: String) -> bool:
	var vector = Globals.direction_map[dir]
	ray_cast_2d.target_position = vector
	ray_cast_2d.force_raycast_update()
	return not ray_cast_2d.is_colliding()

func push(dir: String):
	var vector = Globals.direction_map[dir]
	position += vector
