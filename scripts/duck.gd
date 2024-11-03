class_name Duck
extends StaticBody2D

enum DuckType {
	YELLOW,
	GREEN,
	PINK,
	GOLDEN
}

static var duckDictionary: Dictionary = {
	DuckType.YELLOW : {"speed":1, "points":10,  "sprite":"YellowDuck"},
	DuckType.GREEN :  {"speed":2, "points":20,  "sprite":"GreenDuck"},
	DuckType.PINK :   {"speed":4, "points":40,  "sprite":"PinkDuck"},
	DuckType.GOLDEN : {"speed":4, "points":100, "sprite":"GoldenDuck"}
}

static var my_scene: PackedScene
const SPEED = 100.0

static var globalSpeedMult: float = 1;
var speed_mult: float
var direction: int
var points: int
var duck_type: DuckType

static func Duck(duckType: DuckType, duck_direction := 1, z := 0) -> Duck:
	if(my_scene == null):
		my_scene = load("res://duck.tscn")
	var new_duck: Duck = my_scene.instantiate()
	new_duck.direction = duck_direction
	new_duck.speed_mult = duckDictionary[duckType]["speed"]
	new_duck.points = duckDictionary[duckType]["points"]
	new_duck.duck_type = duckType
	var sprite: Sprite2D = new_duck.get_child(1)
	sprite.texture = load("res://sprites/" + duckDictionary[duckType]["sprite"] + ".png")
	(sprite as Node2D).z_index = z
	new_duck.get_child(0).z_index = z;
	(sprite as Node2D).scale *= Vector2(-duck_direction, 1)
	print((sprite as Node2D).z_index)
	return new_duck

func _process(delta):
	if(direction == 0):
		position.y += delta * SPEED * speed_mult * globalSpeedMult * 2
	position.x += delta * SPEED * direction * speed_mult * globalSpeedMult
