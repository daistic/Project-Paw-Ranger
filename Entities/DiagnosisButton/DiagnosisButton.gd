class_name DiagnosisButton

extends GameButton

@onready var label: Label = $Label

@export var diagnosis: String

func _ready() -> void:
	label.text = diagnosis
	
	if disabled:
		_modulate_gray()

func _on_pressed() -> void:
	if tween:
		tween.kill()
	
	tween = create_tween()
	tween.tween_property(self, "modulate", Color(1.0, 1.0, 1.0), 0.05)
	tween.tween_property(self, "modulate", Color(0.8, 0.8, 0.8), 0.05)
	
	SignalHub.emit_diagnosis_picked(diagnosis)
