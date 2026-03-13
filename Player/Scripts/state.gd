class_name State extends Node

static var player: Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


## 玩家进入这个状态会触发什么
func Enter() -> void:
	pass

## 玩家离开这个状态会触发什么
func Exit() -> void:
	pass


func Process(_detal: float) -> State:
	return null


func Physics(_detal: float) -> State:
	return null


func HandleInput(_event: InputEvent) -> State:
	return null
