class_name Crosshair
extends Area2D

const SPEED = 300.0

func _object_entered(body: Node2D):
	if Input.is_action_just_pressed("fire"):
		# kill the duck
		if body.get_class() == "Duck":
			body.queue_free()
			print(body)

func _ready():
	monitoring = true
	body_entered.connect(_object_entered)

func _process(delta):
	scale = Vector2(1, 1)
	if Input.is_action_just_pressed("fire"):
		scale = Vector2(0.9, 0.9)

	var ver_direction = Input.get_axis("move_up", "move_down")
	var hor_direction = Input.get_axis("move_left", "move_right")

	move_local_y(SPEED * delta * ver_direction)
	move_local_x(SPEED * delta * hor_direction)
