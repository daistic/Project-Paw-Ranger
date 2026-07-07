class_name Academy
extends Node2D

@onready var diagnosis_options: HBoxContainer = $CanvasLayer/UI/MarginContainer/DiagnosisOptions
@onready var score_label: Label = $CanvasLayer/UI/MarginContainer/ScoreLabel

@export var correct_diagnosis_score: int = 100

var current_score: int = 0
var current_client: Client = null

func _enter_tree() -> void:
	SignalHub.dialogue_finished_displaying.connect(_on_dialogue_finished_displaying)
	SignalHub.diagnosis_picked.connect(_on_diagnosis_picked)

func _ready() -> void:
	# Example: If you spawn or have a client in the scene, grab a reference to it
	current_client = $Client 
	pass

func _on_dialogue_finished_displaying() -> void:
	diagnosis_options.show()

func _on_diagnosis_picked(diagnosis: String) -> void:
	diagnosis_options.hide()
	
	if not is_instance_valid(current_client):
		return
	
	if current_client.dialogue_box != null:
		current_client.dialogue_box.stop_dialogue()
	
	if current_client.dialogue.correct_diagnosis == diagnosis:
		add_score(correct_diagnosis_score)
		current_client.handle_resolution()
		current_client = null 
	else:
		print("Wrong diagnosis!")
		current_client.handle_resolution() 
		current_client = null

func add_score(score: int) -> void:
	current_score += score
	score_label.text = str(current_score)
