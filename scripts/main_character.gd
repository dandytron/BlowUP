class_name MainCharacter
extends RigidBody2D

var exploded := false
var explode_position := Vector2.ZERO

func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		exploded = true
		explode_position = get_global_mouse_position()


func _physics_process(delta: float) -> void:
	if exploded:
		var force_vector := explode_position.direction_to(self.position)
		var force_distance := explode_position.distance_to(self.position)
		
		apply_central_impulse(force_vector * (10000/force_distance))
		exploded = false
