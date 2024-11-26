extends RigidBody3D

func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 1 
	self.connect("body_entered", _on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is RigidBody3D:
		queue_free()
