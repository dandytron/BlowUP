extends Node2D

@onready var score_label := %ScoreLabel
@onready var john := %John

func _calc_score():
	var score : int = floor(john.position.y) * -1 + 1027
	var label_text := "High Score: %s" % [ score ]
	score_label.text = label_text

func _process(_delta):
	_calc_score()
