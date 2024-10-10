extends Node3D

@export var power := 10.0

func _physics_process(_delta: float) -> void:
	#_displayed_score = lerp(_displayed_score, score, 0.2)
	if Input.is_action_just_pressed("launch"):
		$ball.apply_impulse((Vector3.FORWARD + Vector3.UP).normalized() * power)

	


func _on_ball_body_entered(body: Node) -> void:
	if body.is_in_group("targets"):
		%WinLabel.text = "YOU WIN"
		await get_tree().create_timer(2.0).timeout

		get_tree().change_scene_to_file("res://main_menu.tscn")


		
