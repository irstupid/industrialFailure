extends Area2D

var originVelocity : Vector2
var velocity : Vector2
var movement : Vector2
var direction = true
var weight : float = 1
var harrpoon : Object

func _ready():
	originVelocity = velocity
	harrpoon = get_node("/root/Root/Game/Harrpoon")
	harrpoon.activeBolt = true

func _physics_process(delta):
	position += velocity
	if(direction):
		movement += abs(velocity)
	else:
		movement -= abs(velocity)
		velocity = originVelocity * 0.2 * -1
	if(movement < Vector2(0, 0) || weight < 0.1):
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if(direction):
		velocity = originVelocity * -1
		direction = false


func _on_tree_exited():
	harrpoon.activeBolt = false
