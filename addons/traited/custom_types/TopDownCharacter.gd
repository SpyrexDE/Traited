extends RigidBody2D

@export var speed = 200
@export var acceleration = 0.1
@export var friction = 0.2

var velocity = Vector2(0, 0)

func _init():
	gravity_scale = 0

func get_input():
	var input = Vector2()
	if Input.is_action_pressed(TRAITED_CONFIG.MOVE_RIGHT_ACTION):
		input.x += 1
	if Input.is_action_pressed(TRAITED_CONFIG.MOVE_LEFT_ACTION):
		input.x -= 1
	if Input.is_action_pressed(TRAITED_CONFIG.MOVE_DOWN_ACTION):
		input.y += 1
	if Input.is_action_pressed(TRAITED_CONFIG.MOVE_UP_ACTION):
		input.y -= 1
	return input

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	linear_velocity = velocity

	var target_angle = position.angle_to(get_global_mouse_position())
	var current_angle = rotation
	var angle_difference = (target_angle - current_angle)
	apply_torque(angle_difference * 100000)
