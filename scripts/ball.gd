extends RigidBody2D


@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@export var size = 0
var grows = 999
var shrinks = 999

func GetGrows(GrowsForLevel):
	grows = GrowsForLevel

func GetShrinks(ShrinksForLevel):
	shrinks = ShrinksForLevel

func _input(event):
	if visible == true:
		if event.is_action_pressed("shrink"):
			if shrinks > 0:
				if size >= -2:
					sprite_2d.scale.x = sprite_2d.scale.x * .6
					sprite_2d.scale.y = sprite_2d.scale.y * .6
					
					collision_shape_2d.scale.x = collision_shape_2d.scale.x * .6
					collision_shape_2d.scale.y = collision_shape_2d.scale.y * .6
					
					size = size - 1
					shrinks = shrinks - 1
	if event.is_action_pressed("grow"):
		if grows > 0:
			if size <= 2:
				sprite_2d.scale.x = sprite_2d.scale.x * 1.4
				sprite_2d.scale.y = sprite_2d.scale.y * 1.4
				
				collision_shape_2d.scale.x = collision_shape_2d.scale.x * 1.4
				collision_shape_2d.scale.y = collision_shape_2d.scale.y * 1.4
				
				size = size + 1
				grows = grows - 1


func SpikeHit():
	self.sleeping = true
	self.visible = false



func HitSpring():
	if size <= 0:
		apply_impulse(Vector2(0, -2500), Vector2(0, 100))
