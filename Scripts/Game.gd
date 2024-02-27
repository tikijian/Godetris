extends Node

@onready var field: TileMap = $Field

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


func create_block():
	var block := BlockFabric.create()
	block.position = field.map_to_local(Vector2i(3, -3))
	field.add_child(block)
