extends Node2D

signal created_damage(damage)
signal exit_battle

var now_spell:Spell

# Called when the node enters the scene tree for the first time.
func _ready():
	update_ui()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_ui():
	$UI/hptxt.text = str(int($Info/Attribute.hp.x)) + '/' + str(int($Info/AttributeLimit.hp.x))
	$UI/ProgressBar.max_value = $Info/AttributeLimit.hp.x
	$UI/ProgressBar.min_value = 0
	$UI/ProgressBar.value = $Info/Attribute.hp.x


func _on_enemy_created_damage(damage):
	print("enemy get damaged")
	$Info.defence(now_spell, damage)
	if $Info/Attribute._is_dead():
		print("Dead")
		exit_battle.emit()
	update_ui()
