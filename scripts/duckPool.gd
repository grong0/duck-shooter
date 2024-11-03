class_name DuckPool
extends Node2D

var pool: Array

var pools = [
	[15, 4, 2, 0],
	[56, 24, 12, 2],
	[60, 40, 25, 7],
	[50, 50, 55, 15],
	[40, 50, 60, 25],
]

var spawnDelay = 3
var roundTimer: float = 0
var running = false
var duckSpawnerIndex

func fillPool(round_num: int):
	for i in range(0, 4):
		for j in range(0, pools[round_num][i]):
			pool.append(i)

func getDuck():
	if pool.size() == 0:
		print("Out Of Ducks")
		running = false
		return 0
	var index = randi() % pool.size()
	return pool.pop_at(index)

func clear_ducks():
	print("clear ducks")
	for i in range(0, 4):
		for node in get_child(i).get_children():
			(node as Duck).direction = 0
	pool.clear()

func startRound(round_num: int):
	running = true
	Duck.globalSpeedMult = 1 * pow(1.2, round_num)
	fillPool(round_num)
	roundTimer = 0
	spawnDelay = 3 / pow(1.2, round_num)
	duckSpawnerIndex = 0

func _process(delta):
	if not running:
		return

	roundTimer += delta
	while (roundTimer >= spawnDelay / 4):
		duckSpawnerIndex += 1
		duckSpawnerIndex %= 4
		(get_child(duckSpawnerIndex) as DuckSpawner).spawn_duck(getDuck())
		roundTimer -= spawnDelay / 4 + randf_range(-0.2, .2)
