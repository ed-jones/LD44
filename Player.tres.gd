extends Area2D


var screen_size
const BULLET_LASER = preload("res://bullets.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	screen_size = get_viewport_rect().size

func fire():
	var bullet = BULLET_LASER.instance()
	bullet.global_position = global_position
	get_parent().add_child(bullet)
