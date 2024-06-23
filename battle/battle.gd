extends CanvasLayer

# 先手枚举变量
enum Offensive{
	PLAYER,
	ENEMY
}

@export var offensive:Offensive # 先手

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var dict = {"Attacker":$player, "Defencer":$enemy}
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	print("Clicked!")
	var temp_spell = $player.info.attack_spell
	# 先玩家
	# 判断施法是否成功
	if $player.info.chant(temp_spell):
		print("Spelled!")
		var damage = $player.info.attack(temp_spell)
		print("create damage:",damage)
		$player.created_damage.emit(damage)
		$action.text = "制造了(" + str(int(damage.x)) + "," + str(int(damage.y)) + ")的伤害"
	else:
		print("Spell Fialed")
	# 后PE
	if $enemy.info.chant(temp_spell):
		print("Spelled!")
		var damage = $enemy.info.attack(temp_spell)
		print("create damage:",damage)
		$enemy.created_damage.emit(damage)
		$action.text = "制造了(" + str(int(damage.x)) + "," + str(int(damage.y)) + ")的伤害"
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
