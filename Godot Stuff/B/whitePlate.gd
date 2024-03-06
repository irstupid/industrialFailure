extends Sprite2D

var selected = false
var clicked = 0

var parent

func _ready():
	parent = get_parent()
	$animation.play("moveUp")

func _process(_delta):
	if(!selected):
		clicked = 0
	elif(clicked >= 30):
		print("good")
		queue_free()

func click():
	if(!selected && parent.canSelect):
		$animation.play("select")
		selected = true
		parent.canSelect = false
		parent.addWhitePlate()
	if(selected && $heatTimer.time_left > 0):
		clicked += 1

func timeout():
	print("bad")
	queue_free()

func animationFinshed(anim_name):
	if(anim_name == "select"):
		$heatTimer.start()

func die():
	parent.canSelect = true
