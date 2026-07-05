extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Client:
		body.set_speed(0.0)
