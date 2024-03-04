class_name Block extends Area2D

const STEP = 48.0

@onready var rotation_point: Node2D = $RotationPoint

var chunks: Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	chunks = find_children('Chunk*', 'Chunk')
	print(rotation_point)
	
func _process(delta):
	pass

func get_chunks_postions() -> Array[Vector2]:
	var result: Array[Vector2]
	result.assign(chunks.map(func(chunk): return to_global(chunk.position)))
	return result
	
func move(direction: Vector2, field: Field):
	var position_shift = direction * STEP
	var new_chunks_coords: Array[Vector2]
	new_chunks_coords.assign(
		get_chunks_postions().map(
			func(coord): return coord + position_shift
		)
	)
	
	if field.has_any_blocks(new_chunks_coords):
		return

	position += position_shift

func flip():
	if name == "O_Block":
		return
		
	rotate(PI/2)
