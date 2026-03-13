class_name LevelTileMap extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	LevelManager.changeTilemapBounds(getTileMapBounds())
	pass # Replace with function body.


func getTileMapBounds() -> Array[Vector2]:
	var bounds: Array[Vector2] = []
	# 左上
	bounds.append(
		Vector2(get_used_rect().position * rendering_quadrant_size)
	)
	
	# 右下
	bounds.append(
		Vector2(get_used_rect().end * rendering_quadrant_size)
	)
	
	return bounds
