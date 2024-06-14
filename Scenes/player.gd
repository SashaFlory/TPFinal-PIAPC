extends CharacterBody3D

@onready var spring_arm_pivot = $Spring_arm_pivot
@onready var spring_arm = $Spring_arm_pivot/SpringArm3D

const SPEED = 20
const JUMP_VELOCITY = 50

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion:
		spring_arm_pivot.rotate_y(deg_to_rad(-event.relative.x * .050))
		spring_arm.rotate_x(deg_to_rad(-event.relative.y * .050))
		spring_arm.rotation.x = clamp(spring_arm.rotation.x, deg_to_rad(-89),deg_to_rad(89))
		
func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction = direction.rotated(Vector3.UP,spring_arm_pivot.rotation.y)
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()