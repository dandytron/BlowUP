extends RichTextLabel


func _ready() -> void:
	SignalBus.draw_total_bombs_exploded.connect(_on_set_high_score)

func _on_set_high_score(total_bomb_count):
	self.text = "Welcome to the Top! Total Bombs Exploded: %s" % [total_bomb_count]
