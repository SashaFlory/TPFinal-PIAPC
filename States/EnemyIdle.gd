# EnemyIdle.gd

extends State

class_name EnemyIdle
@export var enemy : CharacterBody3D

func enter():
	pass

func update_target_location(target_location):
	enemy.update_target_location(target_location)

func Physics_update(delta : float):
	# No necesitas este método en el estado EnemyIdle, puedes dejarlo vacío.
	pass

func Update(delta : float):
	pass





















#extends State
#class_name EnemyIdle

#@export var enemy : CharacterBody2D
#@export var move_speed := 10.0
#
#var direction : Vector2
#var wander_time : float
#
#func randomize_wander():
	#direction = Vector3 (randf_range(-1,1), randf_range(-1,1)).normalized()
	#wander_time = randf_range(1,3)
	#
#func enter():
	#randomize_wander()
#
#func Update(delta : float):
	#if wander_time > 0 : 
		#wander_time -= delta
	#else:
		#randomize_wander()
#
#func Physics_update(delta : float):
	#if enemy:
		#enemy.velocity = direction * move_speed
