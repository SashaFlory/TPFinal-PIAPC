extends State
class_name Follow

@export var enemy: CharacterBody2D
@export var move_speed := 80.0
@export var player : CharacterBody2D

@onready var navAgent := $"../../NavigationAgent2D" as NavigationAgent2D

func Enter():
	player = get_tree().get_first_node_in_group("player")

func Physics_Update(_delta: float):
	navAgent.target_position = player.global_position

	if !navAgent.is_target_reachable():
		navAgent.get_next_path_position()
	
	var current_agent_position = enemy.global_position
	var next_path_position = navAgent.get_next_path_position()
	var new_velocity = current_agent_position.direction_to(next_path_position) * move_speed
	enemy.velocity = new_velocity
	
	enemy.move_and_slide()
	
	var distance_player = player.global_position - enemy.global_position

	if distance_player.length() > 500 :
		print("Pasando a estado PATROL")
		transitioned.emit(self, "Patrol")
		return
	
	if distance_player.length() < 100 :
		print("Pasando a estado ATTACK")
		transitioned.emit(self, "Attack")
		return

