extends Area2D

@export var speed : float
@export var me : PackedScene
@export var funnyPath : bool

func _process(delta):
	position += Vector2(speed * cos(rotation), speed * sin(rotation))
	if(funnyPath):
		if(randf_range(0, 90) < 1):
			rotation += randf_range(-20, 20)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	area.shape_owner_get_owner(area.shape_find_owner(area_shape_index)).add_child(me.instantiate())
	queue_free()
