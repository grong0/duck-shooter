class_name Crosshair
extends Area2D

signal duck_destroyed(duck: Duck)

const SPEED = 300.0

func _process(delta):
	scale = Vector2(1, 1)
	if Input.is_action_just_pressed("fire"):
		scale = Vector2(0.9, 0.9)
		for duck in get_overlapping_bodies():
			if is_instance_of(duck, Duck):
				duck.queue_free()
				duck_destroyed.emit(duck)

	var ver_direction = Input.get_axis("move_up", "move_down")
	var hor_direction = Input.get_axis("move_left", "move_right")

	move_local_y(SPEED * delta * ver_direction)
	move_local_x(SPEED * delta * hor_direction)
