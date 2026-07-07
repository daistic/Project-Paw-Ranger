extends Node

signal dialogue_finished_displaying
signal diagnosis_picked(diagnosis: String)

func emit_dialogue_finished_displaying() -> void:
	dialogue_finished_displaying.emit()

func emit_diagnosis_picked(diagnosis: String) -> void:
	diagnosis_picked.emit(diagnosis)
