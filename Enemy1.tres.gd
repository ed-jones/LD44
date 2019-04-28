extends Node2D

var xspeed = 1
var screen_size
var i = 0
const ENEMY_EXPLOSION = preload("res://EnemyExplosion.tscn")
const BULLET_LASER = preload("res://EnemyLaser.tscn")
const RELOAD_TIME = 4
var reloading = 0.0

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
		queue_free()

func fire():
	if reloading <= 0.0:
		var bullet = BULLET_LASER.instance()
		bullet.init(Vector2(0, 300))
		bullet.global_position = global_position
		get_parent().add_child(bullet)
		reloading = RELOAD_TIME

func drop():
	position.y+=96

func _process(delta):

	if global_position.x < -32 and xspeed < 0:
		drop()
		xspeed = -xspeed


	if global_position.x > 632 and xspeed > 0:
		drop()
		xspeed = -xspeed


	position.x += xspeed

	reloading -= delta
