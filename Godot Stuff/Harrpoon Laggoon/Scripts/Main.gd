extends Node2D

@export var game : PackedScene
@export var menu : PackedScene

var inGame = false

func _ready():
	self.add_child(menu.instantiate())

func _process(delta):
	if(inGame):
		$Game/ScoreLabel.text = str(Score.score)
		$Game/TimeLable.text = str(int($Game/GameTimer.time_left - 1))
		if($Game/GameTimer.time_left -1 < 0):
			# set high scores
			if(Score.score > Score.highScore[0]):
				Score.highScore[4] = Score.highScore[3]
				Score.highScore[3] = Score.highScore[2]
				Score.highScore[2] = Score.highScore[1]
				Score.highScore[1] = Score.highScore[0]
				Score.highScore[0] = Score.score
			elif(Score.score > Score.highScore[1]):
				Score.highScore[4] = Score.highScore[3]
				Score.highScore[3] = Score.highScore[2]
				Score.highScore[2] = Score.highScore[1]
				Score.highScore[1] = Score.score
			elif(Score.score > Score.highScore[2]):
				Score.highScore[4] = Score.highScore[3]
				Score.highScore[3] = Score.highScore[2]
				Score.highScore[2] = Score.score
			elif(Score.score > Score.highScore[3]):
				Score.highScore[4] = Score.highScore[3]
				Score.highScore[3] = Score.score
			elif(Score.score > Score.highScore[4]):
				Score.highScore[4] = Score.score
			inGame = false
			remove_child($Game)
			self.add_child(menu.instantiate())
	else:
		$Menu/highScoreDissplay/Label1/Label.text = str(Score.highScore[0])
		$Menu/highScoreDissplay/Label2/Label.text = str(Score.highScore[1])
		$Menu/highScoreDissplay/Label3/Label.text = str(Score.highScore[2])
		$Menu/highScoreDissplay/Label4/Label.text = str(Score.highScore[3])
		$Menu/highScoreDissplay/Label5/Label.text = str(Score.highScore[4])
		if($Menu/Button.down || Input.is_action_just_pressed("start")):
			inGame = true
			remove_child($Menu)
			self.add_child(game.instantiate())
			Score.score = 0
