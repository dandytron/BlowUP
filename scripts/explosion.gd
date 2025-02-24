extends AnimatedSprite2D

func _ready():
	self.play()
	animation_finished.connect(_on_animation_finished)

func _on_animation_finished():
	queue_free()
