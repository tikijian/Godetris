class_name Block extends Area2D

const STEP = 48.0

var chunks: Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	chunks = find_children('Chunk*', 'Chunk')

func _process(delta):
	pass

func get_chunks_postions() -> Array[Vector2]:
	var result: Array[Vector2]
	result.assign(chunks.map(func(chunk): return to_global(chunk.position)))
	return result
	
