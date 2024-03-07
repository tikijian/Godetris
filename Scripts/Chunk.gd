@icon("res://icon.png")
class_name Chunk
extends Sprite2D

const SPRITE_SIZE = 48
const REGION_COUNT = 4

var tile_index = 0

func _init():
	tile_index = randi_range(0, REGION_COUNT)
	region_rect.position.x = SPRITE_SIZE * tile_index
