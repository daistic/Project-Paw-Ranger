class_name Client

extends RigidBody2D

@onready var dialogue_box: DialogueBox = $DialogueBox

@export var speed: float = 200.0
@export var dialogue: DialogueStruct

func _ready() -> void:
	linear_velocity = Vector2.LEFT * speed
	dialogue = GameManager.get_random_dialogue()

func set_speed(new_speed: float) -> void:
	speed = new_speed
	
	if speed == 0.0:
		linear_velocity = Vector2.ZERO
	else:
		linear_velocity = Vector2.LEFT * speed

func play_dialogue() -> void:
	dialogue_box.show()
	dialogue_box.display_text(dialogue.line)
