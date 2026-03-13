class_name Plant extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$HitBox.Damaged.connect(takeDamage)
	pass # Replace with function body.


func takeDamage(_damage: int) -> void:
	# 清除
	queue_free()
