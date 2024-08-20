extends CanvasLayer



func SizeUpdate(size):
	$SizeLabel.set_text("Cheese size: " + str(size))

func _ready():
	$LevelLabel.set_text("Level " + str(LevelTracker.CurrentLevel + 1))
