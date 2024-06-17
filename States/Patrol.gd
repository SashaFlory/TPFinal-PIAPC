extends State
class_name Patrol

@export var enemy : CharacterBody2D
@export var move_speed := 100.0

var player : CharacterBody2D
var move_direction : Vector2
var wander_time : float
var patrol_timer : float

func randomize_wander():
	move_direction = Vector2 (randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)
	
func Enter():
	randomize_wander()
	player = get_tree().get_first_node_in_group("player")
	patrol_timer = 5.0

func Update(delta : float):
	if wander_time > 0 : 
		wander_time -= delta
	else:
		randomize_wander()

	if patrol_timer > 0:
		patrol_timer -= delta
		#print(patrol_timer)

func Physics_Update(_delta : float):
	if enemy:
		enemy.velocity = move_direction * move_speed
	
	var direction_player = player.global_position - enemy.global_position
	
	if direction_player.length() < 200:
		print("Pasando a estado FOLLOW")
		transitioned.emit(self, "Follow")
		return

	if patrol_timer <= 0:
		print("Pasando a estado IDLE")
		transitioned.emit(self,"Idle")
		return

