extends AnimatableBody2D

func _ready():
	var detection_area := $Area2D
	detection_area.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# NOTE: This works, but doesn't account for glancing (non stationary) blows to the platform corners
	# This may not be a problem since the detection area is far enough from the right and left corners
	if body.name == "John" && body.global_position.y < self.global_position.y:
		SignalBus.john_landed.emit()
