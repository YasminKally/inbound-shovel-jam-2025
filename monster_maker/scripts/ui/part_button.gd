extends Node2D

# keep track of when a monster part is hovering this button
var hovered = false
@export var monster_set: Global.MonsterSet
@export var part_type: Global.PartType
@onready var world: Node2D = $"."

func _process(delta: float) -> void:
	# when the mouse clicks and its over the button
	if Input.is_action_just_pressed("click") and hovered and not Global.dragging:
		# start dragging the part
		Global.dragging = true
		# instantiate monster part
		Global.current_part = Global.monster_part.instantiate()
		# set monster part's texture to the current button's
		var sprite = Global.current_part.get_child(1, true)
		sprite.texture = self.get_child(1, true).texture
		Global.current_part.texture = sprite.texture
		# set metadata of the part acording to the button's
		Global.current_part.monster_set = monster_set
		Global.current_part.part_type = part_type
		# start lifetime timer
		Global.current_part.wait_until = 1
		# add part to the world
		world.add_child(Global.current_part)

func _on_area_2d_mouse_entered() -> void:
	hovered = true

func _on_area_2d_mouse_exited() -> void:
	hovered = false
