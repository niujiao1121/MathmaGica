@tool
extends EditorPlugin
class_name math

func _enter_tree():
	# Initialization of the plugin goes here.
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	pass

# -------------Complex------------------

static func C_multiply(a:Vector2, b:Vector2):
	return Vector2(
		a.x * b.x - a.y * b.y,
		a.x * b.y + a.y * b.x
	)

static func C_num_multiply(a:Vector2, b:float):
	return Vector2(
		a.x * b , a.y * b
	)

static func C_norm(a:Vector2):
	return sqrt(a.x * a.x + a.y * a.y)

static func C_pow(a:Vector2, b:float):
	var r = C_norm(a)
	var theta = atan2(a.y, a.x)
	var result = Vector2(
		pow(r, b) * cos(b * theta),
		pow(r, b) * sin(b * theta)
	)
	return result
	
static func C_clip(a: Vector2, min: float, max: float) -> Vector2:
	return Vector2(
		clamp(a.x, min, max),
		clamp(a.y, min, max)
	)
	
static func C_check_ge_0(a: Vector2):
	return a.x >= 0 and a.y >= 0
	
# ------------Matrix-----------------
static func M_multiply(a:Vector4, b:Vector2):
	return Vector2(
		a.x * b.x + a.y * b.y,
		a.z * b.x + a.w * b.y
	)
