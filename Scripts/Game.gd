extends Node2D

enum State {Move, Drop, Commit}

const BLOCK_SIZE = 48
const HALF_BLOCK = BLOCK_SIZE / 2

@onready var field: Field = $Field
var current_block: Block
var state := State.Move
	
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
	var is_bottom_reached = false
	if state == State.Move:
		is_bottom_reached = handle_input()
	
	if is_bottom_reached:
		commit_block()
	
func handle_input() -> bool:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		return false
		
	if Input.is_action_just_pressed("left"):
		return current_block.move(Vector2.LEFT, field)
	if Input.is_action_just_pressed("right"):
		return current_block.move(Vector2.RIGHT, field)
	if Input.is_action_just_pressed("down"):
		return current_block.move(Vector2.DOWN, field)
	if Input.is_action_just_pressed("up"):
		return current_block.move(Vector2.UP, field)
	if Input.is_action_just_pressed("rotate"):
		current_block.flip()
	return false

func commit_block():
	state = State.Commit
	field.commit_block(current_block)
	current_block.queue_free()
	create_block()
	state = State.Move

func create_block():
	current_block = BlockFabric.create()
	current_block.position = field.map_to_local(Vector2i(3, -3))
	field.add_child(current_block)

func _on_tick():
	if state == State.Move:
		var is_bottom_reached = current_block.move(Vector2.DOWN, field)
		if is_bottom_reached:
			commit_block()
