extends Node

@export var button_type: Global.PartType

@onready var parts: VBoxContainer = $parts

func _ready() -> void:
	Global.hide_others.connect(hide_self)

func _on_button_pressed() -> void:
	# toggle submenu visibility
	parts.visible = not parts.visible
	# hide other menus when clicked
	Global.hide_others.emit(button_type)

func hide_self(id: Global.PartType) -> void:
	# hide your submenu if you're not the one being pressed
	if button_type != id:
		parts.visible = false
