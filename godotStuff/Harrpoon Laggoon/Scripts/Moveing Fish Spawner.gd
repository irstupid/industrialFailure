extends PathFollow2D

@export var fish : PackedScene

func _ready():
	$Timer.start()



func _on_timer_timeout():
	$Timer.start()
	progress_ratio = randf()
	rotation += 90
	rotation += randf_range(-80, 80)
	var newFish = fish.instantiate()
	newFish.position = position
	newFish.rotation = rotation
	get_parent().get_parent().add_child(newFish)
