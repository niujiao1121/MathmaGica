extends Resource
class_name Info

@export var attribute : Attribute
@export var limits : Attribute
@export var wand : Equip
@export var sheild : Equip
@export var attack_spell : Spell
@export var defend_spell : Spell

# Called when the node enters the scene tree for the first time.
func init():
	# 根据上限赋值状态
	attribute.hp = limits.hp
	attribute.sp = limits.sp
	attribute.atk = limits.atk
	attribute.def = limits.def
	
# 判断是否可以施法并扣除法术代价
func chant(spell:Spell):
	# 如果各项施法后均大于零
	if math.C_check_ge_0(attribute.hp - spell.cost.hp) and\
	math.C_check_ge_0(attribute.sp - spell.cost.sp) and\
	math.C_check_ge_0(attribute.atk - spell.cost.atk) and\
	math.C_check_ge_0(attribute.def - spell.cost.def):
		attribute.hp -= spell.cost.hp
		attribute.sp -= spell.cost.sp
		attribute.atk -= spell.cost.atk
		attribute.def -= spell.cost.def
		return true
	else:
		return false

func attack(spell:Spell):
	if spell.speicies == spell.Properties.ATTACK:
		var spell_output = spell.compute(attribute.atk)
		var damage = wand.compute(spell_output)
		return damage
	else:
		return Vector2.ZERO
	
func defence(spell:Spell, damage:Vector2):
	# 防御魔法进行防御计算			
	if not typeof(spell) == TYPE_NIL and spell.speicies == spell.Properties.DEFENCE:
		damage = spell.compute(damage)
		
	damage = math.C_clip(sheild.compute(damage) - attribute.def, 0, 10000)
	attribute.hp -= damage
	return damage
