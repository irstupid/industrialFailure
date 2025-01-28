extends Sprite2D

@export var weight : float
var rotationDirection : float = 0.1
var rotationOffset : float
@export var value : int

func _ready():
	#get_parent().get_parent().weight = get_parent().get_parent().weight * weigh
	pass

func _process(delta):
	rotation = rotationOffset
	rotationOffset += rotationDirection
	if(rotationOffset > 1 || rotationOffset < -1):
		rotationDirection = rotationDirection * -1

func _on_tree_exited():
	Score.score += value
