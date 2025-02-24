extends RichTextLabel

func _ready():
	SignalBus.john_died.connect(_on_john_died)
	SignalBus.game_restart.connect(_on_game_restart)

func _on_john_died():
	self.text = "You Died!"

func _on_game_restart():
	self.text = ""
