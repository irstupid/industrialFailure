extends Node2D

@export var whitePlate : PackedScene
var canSelect = true

func _process(_delta):
	pass

func addWhitePlate():
	add_child.call_deferred(whitePlate.instantiate())
