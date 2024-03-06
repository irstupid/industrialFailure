extends Node2D

var targetPosition = 0;

func _process(_delta):
	$Camera.position.x -= ($Camera.position.x - targetPosition) * 0.1

func boxButton():
	targetPosition = 0

func breakButton():
	targetPosition = 3000;

func bakeButton():
	targetPosition = 6000;

func buildButton():
	targetPosition = 9000;
