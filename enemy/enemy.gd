class_name Enemy extends CharacterBody3D

const SPEED: float = 5.0
const JUMP_VELOCITY: float = 4.5

var player: Player = null

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var aggro_range: float = 12.0

var provoked: bool = false

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func _process(_delta: float) -> void:
	if provoked:
		navigation_agent_3d.target_position = player.global_position

func _physics_process(delta: float) -> void:
	var next_position: Vector3 = navigation_agent_3d.get_next_path_position()
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var direction: Vector3 = global_position.direction_to(next_position)
	var distance: float = global_position.distance_to(player.global_position)
	if distance <= aggro_range:
		provoked = true
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
