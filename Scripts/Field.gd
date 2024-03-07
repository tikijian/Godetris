class_name Field
extends TileMap

func has_any_blocks(coords: Array[Vector2]) -> bool:
	for coord: Vector2 in coords:
		if get_cell_tile_data(0, 
			local_to_map(to_local(coord))
		) != null:
			return true
	
	return false

func commit_block(block: Block):
	var global_transform = get_global_transform()
	for chunk: Chunk in block.chunks:
		var coords = (global_transform * block.transform * chunk.transform).origin
		var pos = local_to_map(to_local(coords))
		# TODO: respect rotation
		set_cell(0, pos, 19, Vector2i(chunk.tile_index, 0))
