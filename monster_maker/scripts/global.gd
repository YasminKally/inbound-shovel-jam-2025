extends Node

# global types for common communication
enum PartType {HEAD, TORSO, LEFT_ARM, RIGHT_ARM, LEFT_LEG, RIGHT_LEG}
enum MonsterSet {NONE, GREAT, CYBER, ROYAL, LIGHT, NYX}

# says whenever a monster part is being dragged around
var dragging = false
# common instance of generic monster part
@onready var monster_part = preload("res://scenes/monster_part.tscn")
# current instantiated monster part. may be null
var current_part: Node2D

signal hide_others(id: Global.PartType)
