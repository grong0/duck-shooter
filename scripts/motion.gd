class_name Motion
extends Node2D

@export var xMult: float = 3;
@export var yMult: float = 11;
@export var rMult: float = 10;


var total_time: float
var offset: Vector2

func _get_x_mod(time: float) -> float:
	return xMult * sin(4 * time + 1) + xMult/2 * cos(7 * time + 1)

func _get_y_mod(time: float) -> float:
	return yMult * cos(3 * time - 4) + yMult/2 * sin(4 * time + 4)

func _get_r_mod(time: float) -> float:
	return rMult * sin(1.4 * time) + rMult/2.1 * cos(1.3 * time + 1)

func _ready():
	total_time = randi() % 100

func _process(delta):
	total_time += delta


	get_parent().position.x += _get_x_mod(total_time) - offset.x
	get_parent().position.y += _get_y_mod(total_time) - offset.y
	get_parent().rotation_degrees = _get_r_mod(total_time)
	
	offset = Vector2(_get_x_mod(total_time), _get_y_mod(total_time))
