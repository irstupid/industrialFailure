extends Area2D

var velocity

func _ready():
	velocity = Vector2(0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position += velocity
