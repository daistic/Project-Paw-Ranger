class_name  DialogueBox
extends MarginContainer

@onready var dialogue_label: RichTextLabel = $MarginContainer/DialogueLabel
@onready var timer: Timer = $Timer

const  MAX_WIDTH = 1

var text: String = ""
var letter_index: int = 0

var letter_time: float = 0.03
var space_time: float = 0.06
var punctuation_time: float = 0.2
var is_active: bool = false

func display_text(text_to_display: String) -> void:
	timer.stop()
	is_active = true
	letter_index = 0
	
	text = text_to_display
	dialogue_label.text = text_to_display
	
	await resized
	custom_minimum_size.x = min(size.x, MAX_WIDTH)
	
	if size.x > MAX_WIDTH:
		dialogue_label.autowrap_mode = TextServer.AUTOWRAP_WORD
		custom_minimum_size.y = size.y
	
	global_position.x -= size.x / 2
	#global_position.y -= size.y + 24
	
	dialogue_label.text = ""
	_display_letter()

func _display_letter():
	if not is_active:
		return
	
	if letter_index >= text.length():
		is_active = false
		SignalHub.emit_dialogue_finished_displaying()
		return
	
	var current_char: String = text[letter_index]
	dialogue_label.text += current_char
	letter_index += 1
	
	match current_char:
		"!", ".", ",", "?":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)

func stop_dialogue() -> void:
	is_active = false
	timer.stop()
	hide()

func _on_timer_timeout() -> void:
	_display_letter()
