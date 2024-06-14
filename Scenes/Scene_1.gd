extends Node3D
@onready var player = $Player
#@onready var wander_direction = $Wander
func _physics_process(delta):
	#get_tree().call_group("FirstEnemy",player.global_transform.origin)
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
