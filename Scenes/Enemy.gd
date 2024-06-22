extends CharacterBody2D
class_name Enemy
@export var player : Node2D
var move_speed = 150.0
@onready var animations = $AnimationPlayer
@onready var navAgent := $"NavigationAgent2D" as NavigationAgent2D

func _physics_process(_delta):
	move_and_slide()
	
	if velocity.length() > 0:
		if velocity.x > 0 and velocity.x > velocity.y:
			animations.play("walk_right")
		elif velocity.y > 0 and velocity.y > velocity.x:
			animations.play("walk_down")
		elif velocity.x < 0 and velocity.x > velocity.y:
			animations.play("walk_left")
		elif velocity.y < 0 and velocity.y > velocity.x:
			animations.play("walk_up")
	
	

	

