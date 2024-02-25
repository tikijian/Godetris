class_name Figure
extends Node2D

enum FigureType {O = 0, T, L, R, Z, S}

var type: FigureType

func _init():
	type = randi_range(0, 2)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
