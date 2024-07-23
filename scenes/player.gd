extends CharacterBody2D

@onready var ray_cast_2d = $RayCast2D
@onready var timer = $Timer

var width = 9

func _ready():
	var viewport
	viewport = get_viewport()
	print(viewport.content_scale_size)
	viewport.content_scale_factor = 960.0 / 144.0
	#viewport.content_scale_size = Vector2i(144, 144)
	# viewport.size
	#print(viewport == get_window().get_viewport())
	#print(get_viewport().size_2d_override)
	# get_viewport().size = Vector2i(4, 4) * width * Globals.grid_scale
	#print(viewport.content_scale_mode, ContentScale)

	print("test")
	
	#viewport.set_global_canvas_transform(viewport.global_canvas_transform.scaled(Vector2(.9, .9)))
	#viewport.get_window().wid
	#viewport.size = Vector2(36, 36) * Globals.grid_scale
	#get_window().size = Vector2i(4, 4) * width * Globals.grid_scale
	#viewport.set_global_canvas_transform(viewport.global_canvas_transform.scaled(Vector2(.9, .9)))

func _on_timer_timeout():
	#get_window().size = Vector2i(4, 4) * width * Globals.grid_scale
	#viewport.size
	width += 1

#func _ready():
	#var tilemap: TileMap = get_parent().get_node("TileMap")
	#var rect = tilemap.get_used_rect()
	#var tile_size = tilemap.tile_set.tile_size
	#$Camera2D.limit_top = rect.position.y * tile_size.y
	#$Camera2D.limit_right = rect.end.x * tile_size.x
	#$Camera2D.limit_bottom = rect.end.y * tile_size.y
	#$Camera2D.limit_left = rect.position.x * tile_size.x

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
