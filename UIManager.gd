class_name UIManager
extends Control

signal next_round

enum StateMachine{
	ROUNDFALL,
	ROUNDDELAY,
	ROUNDUP,
	OFF,
	TUTORIAL,
	TUTORIALUP,
}

var stateTimers: Array[float] = [1, 2, 1]
var state: StateMachine = StateMachine.OFF
var stateTimer: float

var round: int
var flashesPerSecond: float = 4
var flashTimer: float
var flash = false

var infiniTimer: float = 0

var tutorials = [
	[],
	#["GoldenDuck"]
]

@export var roundSignSprites: Array
@export var roundSignAltSprites: Array

func start_next(round: int):
	self.round = round
	state = StateMachine.ROUNDFALL
	print("AAAA")

func _process(delta):
	infiniTimer += delta
	#$"../../Wave".position = Vector2(960 - sin(infiniTimer) * 30, 983 + cos(infiniTimer) * 10)
	($"../../Wave" as Sprite2D).offset = Vector2(- sin(infiniTimer) * 30, cos(infiniTimer) * 10)
	($"../../Wave2" as Sprite2D).offset = Vector2(- cos(infiniTimer) * 30, - sin(infiniTimer) * 10)
	#$"../../Wave2".position = Vector2(960 - cos(infiniTimer) * 30, 883 - sin(infiniTimer) * 10)
	
	
	
	if(state == StateMachine.OFF):
		return
	stateTimer += delta
	flashTimer += delta
	
	if(flashTimer > 1 / flashesPerSecond):
		flashTimer -= 1 / flashesPerSecond
		flash = !flash
		if(flash):
			(get_node("RoundSign") as TextureRect).texture = roundSignSprites[round]
		else:
			(get_node("RoundSign") as TextureRect).texture = roundSignAltSprites[round]
	
	match(state):
		StateMachine.ROUNDFALL:
			#move sign down
			(get_node("RoundSign") as TextureRect).position.y = -300 + 2 * (900 * stateTimer * stateTimer - 600 * stateTimer * stateTimer * stateTimer)
			if(stateTimer > stateTimers[state]):
				stateTimer -= stateTimers[state]
				if(tutorials.size() > round && tutorials[round].size() > 0):
					state = StateMachine.TUTORIAL;
				else:
					state = StateMachine.ROUNDDELAY;
		StateMachine.ROUNDDELAY:
			(get_node("RoundSign") as TextureRect).position.y = 300
			if(stateTimer > stateTimers[state]):
				stateTimer -= stateTimers[state]
				state = StateMachine.ROUNDUP;
				next_round.emit()
		StateMachine.ROUNDUP:
			#move sign up
			(get_node("RoundSign") as TextureRect).position.y = - 300 + 2 * ( 900 * (1-stateTimer) * (1-stateTimer) - 600 * (1-stateTimer) * (1-stateTimer) * (1-stateTimer))
			if(stateTimer > stateTimers[state]):
				stateTimer -= stateTimers[state]
				state = StateMachine.OFF;
		StateMachine.TUTORIAL:
			#wait for click
			pass
		_:
			if(stateTimer > stateTimers[state]):
				stateTimer -= stateTimers[state]
				state = StateMachine.TUTORIALUP
