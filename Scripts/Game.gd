extends Node

var FieldZone = preload("res://FieldZone.tscn")

func _init():
	var figure = Figure.new()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	var container: Node2D = $Container
	var field: TileMap = $Field

	var zone = FieldZone.instantiate()
	zone.position = field.map_to_local(Vector2i(1, 1))
	field.add_child(zone)
	
	#for col in range(12):
		#for row in range(8):
			#var zone = FieldZone.instantiate()
			#zone.position = Vector2(48 * row, 48 * col)
			#container.add_child(zone)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
