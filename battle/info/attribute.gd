@tool
extends Resource
class_name Attribute

# --------enum------------
enum Species{ CREATURE, UNDEAD, GODS} # 种族属性

# --------class-----------
	
@export var species:Species
@export var hp:Vector2
@export var sp:Vector2
@export var atk:Vector2
@export var def:Vector2

func _is_dead():
	if species == Species.CREATURE: return hp.x < 1.
	if species == Species.UNDEAD: return abs(hp.y) < 1.
	if species == Species.GODS: return math.C_norm(hp) < 1.
