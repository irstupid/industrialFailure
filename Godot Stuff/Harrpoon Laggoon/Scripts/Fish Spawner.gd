extends Node2D

@export var fish : PackedScene

func _ready():
	$Timer.start()


func _on_timer_timeout():
	$Timer.start()
	var newFish = fish.instantiate()
	newFish.position = position
	newFish.rotation = rotation
	get_node("game").add_child(newFish)
