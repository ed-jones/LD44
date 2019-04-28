extends Node2D

const LASER = preload("res://Laser.tscn")
var VELOCITY = Vector2(0, -300)
var NUMBER = 1
var lasers = []

func init(velocity, number):
	VELOCITY = velocity
	NUMBER = number

func _ready():
	for i in NUMBER:
		var laser = LASER.instance()
		get_parent().add_child(laser)
		match i:
			0:
				laser.global_position.x = global_position.x - 18
				laser.global_position.y = global_position.y
			1:
				laser.global_position.x = global_position.x + 18
				laser.global_position.y = global_position.y
			2:
				laser.global_position.x = global_position.x - 36
				laser.global_position.y = global_position.y + 12
			3:
				laser.global_position.x = global_position.x + 36
				laser.global_position.y = global_position.y + 12
						
		lasers.append(laser)