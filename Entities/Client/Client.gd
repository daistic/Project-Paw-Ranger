class_name Client

extends RigidBody2D

@export var speed: float = 200.0

func _ready() -> void:
	linear_velocity = Vector2.LEFT * speed

func set_speed(new_speed: float) -> void:
	speed = new_speed
	
	if speed == 0.0:
		linear_velocity = Vector2.ZERO
	else:
		linear_velocity = Vector2.LEFT * speed
