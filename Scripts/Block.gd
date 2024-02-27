class_name Block extends Area2D

const STEP = 48.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_just_pressed("left"):
		position.x -= STEP
	if Input.is_action_just_pressed("right"):
		position.x += STEP
	if Input.is_action_just_pressed("down"):
		position.y += STEP
