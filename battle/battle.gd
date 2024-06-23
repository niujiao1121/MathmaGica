extends CanvasLayer

# 先手枚举变量
enum Offensive{
	PLAYER,
	ENEMY
}

signal displayed_message

@export var offensive:Offensive # 先手

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var dict = {"Attacker":$player, "Defencer":$enemy}
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func show_message(message):
	$action.text = message
	$action/MessageTimer.start()

func _on_button_pressed():
	print("Clicked!")
	var temp_spell = $player.info.attack_spell
	# 先玩家
	# 判断施法是否成功
	if $player.info.chant(temp_spell):
		self.show_message("冒险者使用"+temp_spell.spell_name+\
			"消耗了(" + str(int(temp_spell.cost.sp.x)) + "," + str(int(temp_spell.cost.sp.y)) + ")的魔力值\n"\
			+"魔力剩余(" + str(int($player.info.attribute.sp.x)) + "," + str(int($player.info.attribute.sp.y))+")")
		await $action/MessageTimer.timeout
		
		var damage = $player.info.attack(temp_spell)
		print("create damage:",damage)
		$player.created_damage.emit(damage)
		
		self.show_message("冒险者使用了"+temp_spell.spell_name+\
			"制造了(" + str(int(damage.x)) + "," + str(int(damage.y)) + ")的伤害")
		await $action/MessageTimer.timeout
	else:
		print("Spell Fialed")
	# 后PE
	temp_spell = $enemy.info.attack_spell
	if $enemy.info.chant(temp_spell):
		self.show_message("敌人使用"+temp_spell.spell_name+\
			"消耗了(" + str(int(temp_spell.cost.sp.x)) + "," + str(int(temp_spell.cost.sp.y)) + ")的魔力值\n"\
			+"魔力剩余(" + str(int($enemy.info.attribute.sp.x)) + "," + str(int($enemy.info.attribute.sp.y))+")")
		await $action/MessageTimer.timeout
		var damage = $enemy.info.attack(temp_spell)
		print("create damage:",damage)
		$enemy.created_damage.emit(damage)
		self.show_message("敌人使用了"+temp_spell.spell_name+\
			"制造了(" + str(int(damage.x)) + "," + str(int(damage.y)) + ")的伤害")
		await $action/MessageTimer.timeout
	else:
		print("Spell Fialed")

func _on_enemy_exit_battle():
	var game_handle = get_parent().get_parent().get_parent().get_parent()
	game_handle.set_active(true)
	queue_free()

func _on_player_exit_battle():
	var game_handle = get_parent().get_parent().get_parent().get_parent()
	game_handle.set_active(true)
	queue_free()

