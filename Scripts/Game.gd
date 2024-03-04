extends Node

const BLOCK_SIZE = 48
const HALF_BLOCK = BLOCK_SIZE / 2

@onready var field: Field = $Field
var current_block: Block
	
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
		current_block.move(Vector2.LEFT, field)
	if Input.is_action_just_pressed("right"):
		current_block.move(Vector2.RIGHT, field)
	if Input.is_action_just_pressed("down"):
		current_block.move(Vector2.DOWN, field)
	if Input.is_action_just_pressed("up"):
		current_block.move(Vector2.UP, field)
	if Input.is_action_just_pressed("rotate"):
		current_block.flip()
		
 
func create_block():
	current_block = BlockFabric.create()
	current_block.position = field.map_to_local(Vector2i(3, -3))
	field.add_child(current_block)
