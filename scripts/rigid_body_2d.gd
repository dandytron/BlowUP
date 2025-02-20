extends RigidBody2D

var exploded := false
var explode_position := Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		exploded = true
		explode_position = event.position
		print(event.position)


func _physics_process(delta: float) -> void:
	if exploded:
		print(explode_position)

		# FIX: Bug - camera and mouse click position vector ?
		var force_vector := self.position.direction_to(explode_position)
		var force_distance := explode_position.distance_to(self.position)
		apply_central_impulse(force_vector * (100000/force_distance))
		exploded = false
