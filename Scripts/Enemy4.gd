extends Node2D

var xspeed = 1
var screen_size
var i = 0
const ENEMY_EXPLOSION = preload("res://Scenes/EnemyExplosion.tscn")
const BULLET_LASER = preload("res://Scenes/EnemyLaser.tscn")

func _ready():
	$EnemyArea2D.connect("area_entered", self, "hit")
	screen_size = get_viewport_rect().size

func speedUp(n=1):
	xspeed+=n

func hit(object):
	if object.name != 'EnemyArea2D' and object.name != 'EnemyBulletArea2D':
		var enemyExplosion = ENEMY_EXPLOSION.instance()
		enemyExplosion.global_position = global_position
		get_parent().add_child(enemyExplosion)
		enemyExplosion.love()
		queue_free()

func drop():
	position.y+=96

func _process(delta):

	if global_position.x < -32 and xspeed < 0:
		drop()
		xspeed = abs(xspeed)
		

	if global_position.x > 632 and xspeed > 0:
		drop()
		xspeed = -abs(xspeed)
		

	position.x += xspeed
	
		
