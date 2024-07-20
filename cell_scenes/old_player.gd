extends Sprite2D

var inputs = {
	"ui_up": Vector2.UP,
	"ui_right": Vector2.RIGHT,
	"ui_down": Vector2.DOWN,
	"ui_left": Vector2.LEFT,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_key_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	position += inputs[dir] * 16
