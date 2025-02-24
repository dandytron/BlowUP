extends Node2D

var boom = preload("res://scenes/explosion.tscn")

func create_explosion(mousePosition: Vector2):
	var newExplosion := boom.instantiate()
	newExplosion.set_position(mousePosition)
	add_child(newExplosion)
