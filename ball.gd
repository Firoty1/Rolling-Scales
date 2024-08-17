extends RigidBody2D


@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D


func _input(event):
	if event.is_action_pressed("shrink"):
		sprite_2d.scale.x = sprite_2d.scale.x * .9
		sprite_2d.scale.y = sprite_2d.scale.y * .9
		
		collision_shape_2d.scale.x = collision_shape_2d.scale.x * .9
		collision_shape_2d.scale.y = collision_shape_2d.scale.y * .9
		
	if event.is_action_pressed("grow"):
		sprite_2d.scale.x = sprite_2d.scale.x * 1.1
		sprite_2d.scale.y = sprite_2d.scale.y * 1.1
		
		collision_shape_2d.scale.x = collision_shape_2d.scale.x * 1.1
		collision_shape_2d.scale.y = collision_shape_2d.scale.y * 1.1
		
