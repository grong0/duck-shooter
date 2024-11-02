class_name Duck
extends StaticBody2D

enum DuckType {
	Yellow,
	Green,
	Pink,
	Golden,
	Pirate
}

const my_scene: PackedScene = preload("res://duck.tscn")
const SPEED = 100.0

var speed_mult: float
var direction: int

static func Duck(duckType: DuckType, direction := 1) -> Duck:
	var new_duck: Duck = my_scene.instantiate()
	new_duck.direction = direction
	match(duckType):
		_:
			new_duck.speed_mult = 1
	return new_duck

func _process(delta):
	position.x += delta * SPEED * direction * speed_mult
