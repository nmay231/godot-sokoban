extends CharacterBody2D

@onready var ray_cast_2d = $RayCast2D

func _unhandled_key_input(event):
	for dir in Globals.direction_map.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir: String):
	var vector = Globals.direction_map[dir]
	# Because this is so clunky, I feel like there must be a better
	# way to do it, but it works for now
	ray_cast_2d.target_position = vector
	ray_cast_2d.force_raycast_update()
	var object = ray_cast_2d.get_collider()
	
	if not object:
		position += vector
	elif object.has_method("can_push"):
		if object.can_push(dir):
			ray_cast_2d.position += vector
			ray_cast_2d.force_raycast_update()

			if not ray_cast_2d.is_colliding():
				object.push(dir)
				position += vector
			else:
				print(ray_cast_2d.get_collider())
			ray_cast_2d.position = Vector2(1, 1) * (Globals.grid_scale / 2)
