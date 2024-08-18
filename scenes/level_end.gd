extends Node2D


var Level1 = "res://scenes/level_1.tscn"
var ramp = "res://scenes/ramp.tscn"
var CurrentLevel = 0
var start = "res://scenes/start_menu.tscn"
var Player = "res://scenes/ball.tscn"
var list = [Level1]


func _on_area_2d_body_entered(body):
	CurrentLevel = CurrentLevel + 1
	if CurrentLevel > list.size() - 1:
		get_tree().change_scene_to_file(start)
	else :
		get_tree().change_scene_to_file(list[CurrentLevel])
