extends RichTextLabel

func _ready():
	SignalBus.draw_bombs_ui.connect(_on_draw_bombs)

func _on_draw_bombs(bomb_count):
	self.text = "Bombs: %s" % [ bomb_count ]

