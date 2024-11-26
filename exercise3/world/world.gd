extends Node3D

@export var power := 10.0

func _process(_delta: float) -> void:
	if get_tree().get_nodes_in_group("cubes").size() == 0:
			%CubesLeft.text = "Cubes Left : 0/3"
			%WinLabel.text = "YOU WIN"
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")
	else:
		%CubesLeft.text = "Cubes Left : %s/3" % get_tree().get_nodes_in_group("cubes").size()
	


	
