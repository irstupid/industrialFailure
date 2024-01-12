extends Node2D

@export var bolt : PackedScene
const boltSpeed = 20
const turnSpeed = 0.1;
var activeBolt = false
var angleOffset = 0;

func _process(delta):
	rotation = atan2(position.y - get_viewport().get_mouse_position().y, position.x - get_viewport().get_mouse_position().x) + deg_to_rad(180) + angleOffset
	if(Input.is_action_just_pressed("Click") || Input.is_action_just_pressed("1") && !activeBolt):
		var newBolt = bolt.instantiate()
		newBolt.rotation = rotation
		newBolt.position = position
		newBolt.velocity = Vector2(boltSpeed * cos(rotation), boltSpeed * sin(rotation))
		get_parent().add_child(newBolt)
	if(activeBolt):
		get_parent().get_node("Line2D").set_point_position(1, get_parent().get_node("Bolt").position)
	else:
		get_parent().get_node("Line2D").set_point_position(1, position)
	
	if(Input.is_action_pressed("a")):
		angleOffset -= turnSpeed
	if(Input.is_action_pressed("d")):
		angleOffset += turnSpeed
