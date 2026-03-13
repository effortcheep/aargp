class_name State_Idle extends State

@onready var walk: State = $"../Walk"
@onready var attack: State = $"../Attack"

## 玩家进入这个状态会触发什么
func Enter() -> void:
	player.UpdateAnimation('idle')
	pass

## 玩家离开这个状态会触发什么
func Exit() -> void:
	pass


func Process(_detal: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	
	player.velocity = Vector2.ZERO
	return null


func Physics(_detal: float) -> State:
	return null


func HandleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
