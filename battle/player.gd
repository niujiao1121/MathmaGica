extends Node2D

signal created_damage(damage)
signal exit_battle

@export var info : Info
var now_spell:Spell

# Called when the node enters the scene tree for the first time.
func _ready():
	info.init() # 更新血量为血量上限
	update_ui()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_ui():
	$UI/hptxt.text = str(int(info.attribute.hp.x)) + '/' + str(int(info.limits.hp.x))
	$UI/ProgressBar.max_value = info.limits.hp.x
	$UI/ProgressBar.min_value = 0
	$UI/ProgressBar.value = info.attribute.hp.x

func _on_enemy_created_damage(damage):
	print("enemy get damaged")
	info.defence(now_spell, damage)
	if info.attribute._is_dead():
		get_parent().show_message("敌人被打败了！")
		await get_parent().get_node("action").get_node("MessageTimer").timeout
		exit_battle.emit()
	update_ui()
