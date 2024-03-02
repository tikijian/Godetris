extends Node

const BLOCK_SIZE = 48

@onready var field: Field = $Field
var current_block: Block

func _init():
	pass
	

# Called when the node enters the scene tree for the first time.
func _ready():
	create_block()
	
	#for col in range(12):
		#for row in range(8):
			#var zone = FieldZone.instantiate()
			#zone.position = Vector2(48 * row, 48 * col)
			#container.add_child(zone)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("left"):
		current_block.position.x -= 48


	if Input.is_action_just_pressed("right"):
		current_block.position.x += 48
	if Input.is_action_just_pressed("down"):
		current_block.position.y += 48
	if Input.is_anything_pressed():
		var chunks_coords = current_block.get_chunks_postions()
		print("has blocks? ", field.has_any_blocks(chunks_coords))



func create_block():
	current_block = BlockFabric.create()
	current_block.position = field.map_to_local(Vector2i(0, 0)) + Vector2(BLOCK_SIZE / 2, 0)
	field.add_child(current_block)
