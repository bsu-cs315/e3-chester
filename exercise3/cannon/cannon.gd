extends Node3D

@export var rotation_speed: float = 3.0

var ball: PackedScene = preload("res://ball/ball.tscn")

var min_pitch_angle_deg: float = 0.0   
var max_pitch_angle_deg: float = 180.0

func _physics_process(delta: float) -> void:
	var rotation_input = 0.0

	if Input.is_action_pressed("rotate_up"):  
		rotation_input -= 1.0
	if Input.is_action_pressed("rotate_down"):
		rotation_input += 1.0

	if rotation_input != 0.0:
		rotate_x(rotation_input * rotation_speed * delta)

		rotation_degrees.x = fmod(rotation_degrees.x, 360.0)

		rotation_degrees.x = clamp(rotation_degrees.x, min_pitch_angle_deg, max_pitch_angle_deg)
		rotation.x = deg_to_rad(rotation_degrees.x)
		
	if Input.is_action_just_pressed("fire"):
		fire_ball()

func fire_ball() -> void:
	var ball_instance = ball.instantiate()
	get_parent().add_child(ball_instance)

	ball_instance.global_transform = self.global_transform

	var direction = -global_transform.basis.z.normalized()

	var ball_speed = 20.0  

	ball_instance.linear_velocity = direction * ball_speed
