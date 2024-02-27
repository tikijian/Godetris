@icon("res://icon.png")
class_name Chunk
extends Sprite2D

const SPRITE_SIZE = 48
const REGION_COUNT = 4

func _init():
	region_rect.position.x = SPRITE_SIZE * randi_range(0, REGION_COUNT)
