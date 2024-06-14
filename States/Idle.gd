extends State
class_name Idle

@export var enemy : CharacterBody2D
@export var move_speed := 100.0
var player : CharacterBody2D
var direction : Vector2
var wander_time : float

func randomize_wander():
	direction = Vector2 (randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)
	
func Enter():
	randomize_wander()
	player = get_tree().get_first_node_in_group("player")

func Update(delta : float):
	if wander_time > 0 : 
		wander_time -= delta
	else:
		randomize_wander()

func Physics_Update(delta : float):
	if enemy:
		enemy.velocity = direction * move_speed
		
	var direction = player.global_position - enemy.global_position
	
	#if direction.length() < 30:
		#Transitioned.emit(self, "follow")
		#return

