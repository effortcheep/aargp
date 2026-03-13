class_name State_Walk extends State

@export var move_speed: float = 100.0

@onready var idle = $"../Idle"
@onready var attack = $"../Attack"

## 玩家进入这个状态会触发什么
func Enter() -> void:
	player.UpdateAnimation('walk')
	pass

## 玩家离开这个状态会触发什么
func Exit() -> void:
	pass


func Process(_detal: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation('walk')
	return null


func Physics(_detal: float) -> State:
	return null


func HandleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
