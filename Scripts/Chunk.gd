extends Sprite2D

var region_offset = 0

const SPRITE_SIZE = 48
const REGION_COUNT = 4

func _init():
	region_offset = randi_range(0, REGION_COUNT)
	region_rect.position.x = SPRITE_SIZE * region_offset
