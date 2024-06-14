# Enemy.gd

extends CharacterBody3D

@export var wander_direction : Node3D

@onready var nav_agent = $NavigationAgent3D
var speed = 10

func _physics_process(delta):
	if nav_agent.get_next_path_position():
		var next_location = nav_agent.get_next_path_position()
		var direction = next_location - global_transform.origin
		if direction.length_squared() > 0.1:
			direction = direction.normalized() * speed
			velocity = direction
		else:
			velocity = Vector3.ZERO
			nav_agent.target_position = get_random_destination()
	else:
		velocity = Vector3.ZERO

func get_random_destination():
	# Aquí podrías devolver un punto aleatorio dentro del Navmesh para que el enemigo se mueva.
	# Por ejemplo, podrías obtener un punto aleatorio dentro de un área definida por el Navmesh.
	# Esto dependerá de cómo esté configurado tu Navmesh y de tus requisitos específicos.
	return Vector3.ZERO



















#extends CharacterBody3D
#
#@export var wander_direction : Node3D
#
#@onready var nav_agent = $NavigationAgent3D
#
#var speed = 10
#
#func _physics_process(delta):
	##var current_location = global_transform.origin
	##var next_location =  nav_agent.get_next_path_position()
	##var new_velocity = (next_location - current_location).normalized() * speed
	##velocity = new_velocity
	##velocity = wander_direction.direction * speed
	#move_and_slide()
	#
##func update_target_location(target_location):
##	nav_agent.target_position = target_location 
#
##func _on_area_3d_body_entered(body):
##	pass # Replace with function body.
