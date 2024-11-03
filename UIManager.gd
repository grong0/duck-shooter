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
			
			if(stateTimer > stateTimers[state]):
				stateTimer -= stateTimers[state]
				if(tutorials.size() < round):
					state = StateMachine.TUTORIAL;
				else:
					state = StateMachine.ROUNDDELAY;
		StateMachine.ROUNDDELAY:
			if(stateTimer > stateTimers[state]):
				stateTimer -= stateTimers[state]
				state = StateMachine.ROUNDUP;
				next_round.emit()
		StateMachine.ROUNDUP:
			#move sign up
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
