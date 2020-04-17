extends Node2D

const LASER = preload("res://Laser.tscn")
var VELOCITY = Vector2(0, -300)
var NUMBER = 1

func init(velocity, number):
	VELOCITY = velocity
	NUMBER = number

func _process(delta):
    move(delta)
    removeWhenOffScreen()

func move(delta):
    global_position += VELOCITY * delta

func removeWhenOffScreen():
    if global_position.y < 0:
        queue_free()

func _ready():
	$LaserArea2D.connect("area_entered", self, "hit")
	var laser = LASER.instance()
	laser.global_position = global_position
	get_parent().add_child(laser)


func hit(object):
    if object.name == 'EnemyArea2D':
        queue_free()