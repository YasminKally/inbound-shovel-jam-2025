extends Node2D

@export var slot_type: Global.PartType
var current_set = Global.MonsterSet.NONE

# keep track of whenever the slot is able to receive a part
var can_receive = false

func _on_area_entered(area: Area2D) -> void:
	can_receive = true

func _on_area_exited(area: Area2D) -> void:
	can_receive = false

func _process(delta: float) -> void:
	# if a part is being dragged and it is already ok to deal with it 
	if Global.dragging and Global.current_part.wait_until <= 0:
		# if the mouse clicked
		if Input.is_action_just_pressed("click"):
			# if the mouse clicked over the slot and it's a valid part
			if can_receive and slot_type == Global.current_part.part_type:
				# set slot properties from monster part
				current_set = Global.current_part.monster_set
				self.get_child(1, true).texture = Global.current_part.texture
			# destroy monsterpart even if it's not a valid part
			Global.current_part.queue_free()
			# [WORKAROUND] if it's the last slot checking for
			#  clicks, disable dragging state
			if slot_type == Global.PartType.RIGHT_LEG:
				Global.dragging = false
	# while lifetime timer is not ready, decrease it if a part is being dragged
	elif Global.dragging:
		Global.current_part.wait_until -= delta
