class_name State_Attach extends State

var attacking: bool = false

@export var attack_sound: AudioStream

@export_range(1, 20, 0.5) var decerate_speed: float = 5.0

@onready var attach_animation: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

@onready var walk = $"../Walk"
@onready var idle = $"../Idle"


## 玩家进入这个状态会触发什么
func Enter() -> void:
	player.UpdateAnimation('attack')
	attach_animation.play("attack_" + player.AnimDirection())
	animation_player.animation_finished.connect(EndAttack)
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	
	attacking = true
	pass

## 玩家离开这个状态会触发什么
func Exit() -> void:
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	pass


func Process(_detal: float) -> State:
	player.velocity -= player.velocity * decerate_speed * _detal
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null


func Physics(_detal: float) -> State:
	return null

func HandleInput(_event: InputEvent) -> State:
	return null

func EndAttack(_newAnimName: String) -> void:
	attacking = false
