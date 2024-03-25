extends Node2D

var shards = [null, null, null, null, null, null, null, null, null, null];

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(shards[0] != null):
		$Square3.modulate = shards[0]
