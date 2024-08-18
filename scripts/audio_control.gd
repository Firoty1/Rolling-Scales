extends Node

var Music = "res://Clement Panchout - Sweet 70s.wav"

func _ready():
	MusicPlays()

func MusicPlays():
	$Music.stream(Music)
	$Music.play()
