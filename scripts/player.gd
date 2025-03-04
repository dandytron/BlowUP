class_name Player
extends RigidBody2D

@onready var explosion_layer := %ExplosionLayer

var bomb_count := 4
var total_bomb_count := 0

func _ready():
	SignalBus.john_landed.connect(_on_john_landed)

func _on_john_landed():
	bomb_count = 4
	SignalBus.draw_bombs_ui.emit(bomb_count)
#
func _apply_vector(mouse_position :Vector2):
	var force_vector := mouse_position.direction_to(self.position)
	var force_distance := mouse_position.distance_to(self.position)

	# TODO: Godot4 curves for simplifiying the impulse algo? https://www.youtube.com/watch?v=cTSrjN_2qDI
	apply_central_impulse(force_vector * (10000/force_distance))

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("LeftMouseClick") && bomb_count > 0:
		bomb_count -= 1
		total_bomb_count += 1

		SignalBus.draw_total_bombs_exploded.emit(total_bomb_count)
		SignalBus.draw_bombs_ui.emit(bomb_count)

		var pos := get_global_mouse_position()
		explosion_layer.create_explosion(pos)
		_apply_vector(pos)
