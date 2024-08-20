extends Control

@onready var start_button = %StartButton
@onready var quit_button = %QuitButton


# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.grab_focus()
	
func _process(delta):
	$Path2D/PathFollow2D.progress += 300 * delta
	$Path2D/PathFollow2D.rotation += 4 * delta

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
