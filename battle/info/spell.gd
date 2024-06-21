extends Resource
class_name Spell

# --------enum------------
enum Properties{ ATTACK, DEFENCE} # 进攻属性

# --------class-----------
@export var spell_name : String
@export var spell_properties : Vector4
@export var speicies : Properties
@export var cost : Attribute

func compute(attack):
	var result = math.M_multiply(spell_properties, attack)
	return result
