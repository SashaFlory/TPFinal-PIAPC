extends State
class_name Patrol

@export var enemy : CharacterBody2D
@export var move_speed := 100.0
var player : CharacterBody2D
var move_direction : Vector2
var wander_time : float

func randomize_wander():
	move_direction = Vector2 (randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)
	
func Enter():
	randomize_wander()
	player = get_tree().get_first_node_in_group("player")

func Update(delta : float):
	if wander_time > 0 : 
		wander_time -= delta
	else:
		randomize_wander()
	
	

func Physics_Update(_delta : float):
	if enemy:
		enemy.velocity = move_direction * move_speed
		
	var direction_player = player.global_position - enemy.global_position
	
	if direction_player.length() < 200:
		print("Pasando a estado Follow")
		transitioned.emit(self, "Follow")
		return

