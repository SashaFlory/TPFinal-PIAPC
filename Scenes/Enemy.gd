extends CharacterBody2D
class_name Enemy

@onready var animations = $AnimationPlayer

func _physics_process(delta):
	move_and_slide()
	
	if velocity.length() > 0:
		if velocity.x > 0:
			animations.play("walk_right")
		elif velocity.x < 0:
			animations.play("walk_left")
		elif velocity.y < 0:
			animations.play("walk_up")
		elif velocity.y > 0:
			animations.play("walk_down")
	
	if velocity.length() == 0:
		animations.play("idle")
	

