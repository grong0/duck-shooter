class_name Duck
extends StaticBody2D

enum DuckType {
	Yellow,
	Green,
	Pink,
	Golden
}

static var duckDictionary: Dictionary = {
	DuckType.Yellow : {"speed":1, "points":10,  "sprite":"YellowDuck"},
	DuckType.Green :  {"speed":2, "points":20,  "sprite":"GreenDuck"},
	DuckType.Pink :   {"speed":4, "points":40,  "sprite":"PinkDuck"},
	DuckType.Golden : {"speed":4, "points":100, "sprite":"GoldenDuck"}
}

static var my_scene: PackedScene
const SPEED = 100.0

var speed_mult: float
var direction: int
var points: int

static func Duck(duckType: DuckType, direction := 1) -> Duck:
	if(my_scene == null):
		my_scene = load("res://duck.tscn")
	var new_duck: Duck = my_scene.instantiate()
	new_duck.direction = direction
	new_duck.speed_mult = duckDictionary[duckType]["speed"]
	new_duck.points = duckDictionary[duckType]["points"]
	var sprite: Sprite2D = new_duck.get_child(0)
	sprite.texture = load("res://Sprites/" + duckDictionary[duckType]["sprite"] + ".png")
	return new_duck

func _process(delta):
	position.x += delta * SPEED * direction * speed_mult
