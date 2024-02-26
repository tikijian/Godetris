class_name BlockFabric

enum BlockType {O = 1, T, L, R, Z, S}

#var O_Block = preload("res://Blocks/O_Block.tscn")
#var T_Block = preload("res://Blocks/T_Block.tscn")
#var L_Block = preload("res://Blocks/L_Block.tscn")
#var R_Block = preload("res://Blocks/R_Block.tscn")
#var Z_Block = preload("res://Blocks/Z_Block.tscn")
#var S_Block = preload("res://Blocks/S_Block.tscn")

# TODO: typed return
static func create():
	match(randi_range(1, BlockType.size()) as BlockType):
		BlockType.O:
			return preload("res://Blocks/O_Block.tscn").instantiate()
		BlockType.T:
			return preload("res://Blocks/T_Block.tscn").instantiate()
		BlockType.L:
			return preload("res://Blocks/L_Block.tscn").instantiate()
		BlockType.R:
			return preload("res://Blocks/R_Block.tscn").instantiate()
		BlockType.Z:
			return preload("res://Blocks/Z_Block.tscn").instantiate()
		BlockType.S:
			return preload("res://Blocks/S_Block.tscn").instantiate()
