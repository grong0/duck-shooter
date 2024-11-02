extends StaticBody2D

const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	# Handle jump.
	if Input.is_action_just_pressed("fire"):
		pass

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("move_left"):
		pass

	var ver_direction = Input.get_axis("move_down", "move_up")
	var hor_direction = Input.get_axis("move_left", "move_right")

	print(ver_direction)
	print(hor_direction)

	move_local_y(SPEED * delta * ver_direction)
	move_local_x(SPEED * delta * hor_direction)
