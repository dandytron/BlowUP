extends Node2D

var boom = preload("res://scenes/explosion.tscn")

func create_explosion(mousePosition):
	var newExplosion := boom.instantiate()
	newExplosion.set_position(mousePosition)
	add_child(newExplosion)


# # Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("LeftMouseClick"):
		create_explosion(get_global_mouse_position())

