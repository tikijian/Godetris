class_name Field
extends TileMap

const START_ROW = -3
const COLS = 8
const ROWS = 11

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
		commit_rows()

func commit_rows():
	var deleted_rows = []
	var should_shift_chunks = false
	
	for row in range(ROWS, START_ROW, -1):
		if range(0, COLS).any(func(col): return get_cell_tile_data(0, Vector2i(col, row)) == null):
			continue
		should_shift_chunks = true
		if row not in deleted_rows:
			deleted_rows.append(row)
		for col in range(0, COLS):
			move_chunks(col, row)
		
func move_chunks(x: int, y: int):
	if y == START_ROW - 1:
		return

	var current_coord = Vector2i(x, y)
	if get_cell_tile_data(0, current_coord) == null:
		return move_chunks(x, y - 1)
	
	set_cell(0, current_coord)
	
	var next_coord = Vector2i(current_coord.x, current_coord.y - 1)
	var next_tile = get_cell_tile_data(0, next_coord)
	if next_tile != null:
		set_cell(0, current_coord, 19, get_cell_atlas_coords(0, next_coord))

	move_chunks(next_coord.x, next_coord.y)

func shift_chunks():
	for row in range(ROWS - 1, START_ROW, -1):
		for col in range(0, COLS):
			var current_coord = Vector2i(col, row)
			var tile_data = get_cell_tile_data(0, current_coord)

			if tile_data == null:
				continue
			
			_shift_chunk(current_coord)

func _shift_chunk(current_coord: Vector2i):
	var next_coord = Vector2i(current_coord.x, current_coord.y + 1)
	var next_tile = get_cell_tile_data(0, next_coord)
	
	if next_tile != null:
		set_cell(0, current_coord, 19, get_cell_atlas_coords(0, current_coord))
		return
		
	set_cell(0, current_coord) 
	_shift_chunk(next_coord)
	
