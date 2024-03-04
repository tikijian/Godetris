class_name BlockFabric

enum BlockType {O = 1, T, I, L, R, Z, S}

static func create() -> Block:
	match(randi_range(1, BlockType.size()) as BlockType):
		BlockType.O:
			return preload("res://Blocks/O_Block.tscn").instantiate()
		BlockType.T:
			return preload("res://Blocks/T_Block.tscn").instantiate()
		BlockType.I:
			return preload("res://Blocks/I_Block.tscn").instantiate()
		BlockType.L:
			return preload("res://Blocks/L_Block.tscn").instantiate()
		BlockType.R:
			return preload("res://Blocks/R_Block.tscn").instantiate()
		BlockType.Z:
			return preload("res://Blocks/Z_Block.tscn").instantiate()
		BlockType.S, _:
			return preload("res://Blocks/S_Block.tscn").instantiate()
