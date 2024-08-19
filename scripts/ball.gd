extends RigidBody2D

class_name Player

var size = 0
var scaleMultiplier = 1.4

var is_dead = false

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var hud = $"../HUD"

func _input(event):
	if is_dead == false:
		if event.is_action_pressed("shrink"):
			if size > -2:
				sprite_2d.scale.x = sprite_2d.scale.x / scaleMultiplier
				sprite_2d.scale.y = sprite_2d.scale.y / scaleMultiplier
				
				collision_shape_2d.scale.x = collision_shape_2d.scale.x / scaleMultiplier
				collision_shape_2d.scale.y = collision_shape_2d.scale.y / scaleMultiplier
				
				size = size - 1
				
				hud.SizeUpdate(size)
				AudioControl.ShrinkSound()
				
		if event.is_action_pressed("grow"):
			if size < 2:
				sprite_2d.scale.x = sprite_2d.scale.x * scaleMultiplier
				sprite_2d.scale.y = sprite_2d.scale.y * scaleMultiplier
				
				collision_shape_2d.scale.x = collision_shape_2d.scale.x * scaleMultiplier
				collision_shape_2d.scale.y = collision_shape_2d.scale.y * scaleMultiplier
				
				size = size + 1
				
				hud.SizeUpdate(size)
				AudioControl.GrowSound()
		
func activateTurbo():
	var movement_direction = self.linear_velocity.normalized()
	apply_central_impulse(movement_direction * 2500)
	AudioControl.BoostSound()
	
func SpikeHit():
	self.is_dead = true
	self.sleeping = true
	$Sprite2D.visible = false
	AudioControl.DeathSound()
	$CPUParticles2D.emitting = true

func HitSpring():
	if size <= 0:
		apply_impulse(Vector2(0, -2500), Vector2(0, 100))
		AudioControl.SpringSound()


func _on_cpu_particles_2d_finished():
	get_tree().reload_current_scene()
