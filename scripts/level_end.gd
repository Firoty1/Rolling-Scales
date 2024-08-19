extends Node2D


var Level1 = "res://scenes/level_1.tscn"
var Level2 = "res://level_2.tscn"
var CurrentLevel = 0
var start = "res://scenes/start_menu.tscn"
var Player = "res://scenes/ball.tscn"
var list = [Level1, Level2]


func _on_area_2d_body_entered(body):
	$Wait.start()
	

func SceneChange():
	CurrentLevel = CurrentLevel + 1
	if CurrentLevel > list.size() - 1:
		AudioControl.GameWinSound()
		get_tree().change_scene_to_file(start)
	else :
		AudioControl.WinSound()
		get_tree().change_scene_to_file(list[CurrentLevel])
	
