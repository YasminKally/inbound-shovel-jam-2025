extends Node2D

@export var monster_set: Global.MonsterSet
@export var part_type: Global.PartType
# current part texture
var texture: Texture2D
# lifetime timer to avoid being destroyed on instantiation
var wait_until = 0

# drag itself along the mouse
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Global.dragging:
		position += event.relative
