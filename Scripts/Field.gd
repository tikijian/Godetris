class_name Field
extends TileMap

func _process(delta):
	pass

func has_any_blocks(coords: Array[Vector2]) -> bool:
	for coord: Vector2 in coords:
		if get_cell_tile_data(0, local_to_map(to_local(coord))) != null:
			return true
	
	return false
