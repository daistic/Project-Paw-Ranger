extends Node

const DIALOGUE_DATABASE: DialogueResource = preload("uid://cokb6u7wq1o2t")

func get_random_dialogue() -> DialogueStruct:
	if DIALOGUE_DATABASE and DIALOGUE_DATABASE.dialogues.size() > 0:
		return DIALOGUE_DATABASE.dialogues.pick_random()
	
	return null
