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
		for i in parent.get_parent().get_node("Bake").shards.size():
			if(parent.get_parent().get_node("Bake").shards[i] == null):
				parent.get_parent().get_node("Bake").shards[i] = Color(1, 1, 1)
				break
			elif(i == parent.get_parent().get_node("Bake").shards.size()):
				print("ERROR: shard storage full")
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
