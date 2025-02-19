extends Sprite2D

var exploded := false
var explode_position := Vector2.ZERO

func _input(event):
    if event is InputEventMouseButton and event.is_pressed():
        exploded = true
        explode_position = event.position
        print(event.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# TODO: add explosion on event.position
    if exploded:
      pass
    else:
      pass
