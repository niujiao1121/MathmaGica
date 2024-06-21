extends Resource
class_name Equip

# --------enum------------
enum Crystal{ WHITE, YELLOW, ORANGE, BLACK, GREEN, PINK} # 水晶属性
enum Properties{ ATTACK, DEFENCE} # 进攻属性

# --------class-----------
@export var crystal:Crystal
@export var equip:Properties
@export var quality:float

func compute(attack:Vector2):
	if crystal == Crystal.WHITE:
		if equip == Properties.ATTACK:
			return attack + Vector2(100 * quality, 100 * quality)
		else:
			return attack - Vector2(100 * quality, 100 * quality)
	
	if crystal == Crystal.YELLOW:
		if equip == Properties.ATTACK:
			return 4 * quality * attack
		else:
			return 1. / (4. * quality) * attack
			
	if crystal == Crystal.ORANGE:
		if equip == Properties.ATTACK:
			return math.C_pow(attack, 1 + quality)
		else:
			return math.C_pow(attack, 1 - quality)
	
	if crystal == Crystal.BLACK:
		var result = Vector2(quality * attack.y, quality * attack.x)
		return result
		
	if crystal == Crystal.GREEN:
		return  math.C_num_multiply(attack, -quality)
		
	if crystal == Crystal.PINK:
		return  math.C_num_multiply(math.C_pow(attack, 0.5), 10 * quality)
