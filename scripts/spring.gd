extends Node2D

func _on_collision_shape_2d_body_entered(body):
	body.HitSpring()
