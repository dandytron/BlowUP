class_name MainCharacter
extends RigidBody2D


func apply_vector(mouse_position :Vector2):
	var force_vector := mouse_position.direction_to(self.position)
	var force_distance := mouse_position.distance_to(self.position)

	# TODO: Godot4 curves for simplifiying the impulse algo? https://www.youtube.com/watch?v=cTSrjN_2qDI
	apply_central_impulse(force_vector * (10000/force_distance))

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("LeftMouseClick"):
		apply_vector(get_global_mouse_position())
