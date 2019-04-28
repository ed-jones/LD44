extends Node2D


var screen_size
const BULLET_LASER = preload("res://lasers.tscn")
#const ENEMY_EXPLOSION = preload("res://EnemyExplosion.tscn")

var reloading = 0.0
var laserLevel = 1
var shotSpeed = 1
var damage = 1


func _ready():
	$PlayerArea2D.connect("area_entered", self, "hit")
	screen_size = get_viewport_rect().size
	

func fire():
	if reloading <= 0.0:
		var laser = BULLET_LASER.instance()
		laser.init(Vector2(0, -300), laserLevel)
		laser.global_position = global_position
		get_parent().add_child(laser)
		reloading = 0.8/shotSpeed

func _process(delta):
    reloading -= delta

func hit(object):
	if object.name != 'LaserArea2D' and object.name != 'HealthBonusArea2D':
		$AudioStreamPlayer2D.play()
#		var enemyExplosion = ENEMY_EXPLOSION.instance()
#		enemyExplosion.global_position = global_position
#		get_parent().add_child(enemyExplosion)
		get_parent().get_node("Health").damage()
	if object.name == 'HealthBonusArea2D':
		get_parent().get_node("Health").healthup()
		$PlayerArea2D/Health.play()
	if object.name == 'EnemyArea2D':
		get_parent().gameOver()
		$AudioStreamPlayer2D.play()
		

func upgradeLaser():
	if get_parent().get_node("Health").getHealth() > 2 and laserLevel <= 4:
		laserLevel+=1
		get_parent().get_node("Buttons/SmallNumber/Sprite").frame += 1
		get_parent().get_node("Health").damage(2)
	
func downgradeLaser():
	if laserLevel > 1:
		laserLevel-=1
		get_parent().get_node("Buttons/SmallNumber/Sprite").frame -= 1
		get_parent().get_node("Health").healthup(2)
	
func upgradeShotSpeed():
	if get_parent().get_node("Health").getHealth() > 3 and laserLevel <= 9:
		shotSpeed+=1
		get_parent().get_node("Buttons/SmallNumber2/Sprite").frame += 1
		get_parent().get_node("Health").damage(3)
	
func downgradeShotSpeed():
	if shotSpeed > 1:
		shotSpeed-=1
		get_parent().get_node("Buttons/SmallNumber2/Sprite").frame -= 1
		get_parent().get_node("Health").healthup(3)
	
func upgradeDamage():
	if get_parent().get_node("Health").getHealth() > 6 and damage <= 4:
		get_parent().get_node("Buttons/SmallNumber3/Sprite").frame += 1
		get_parent().get_node("Health").damage(6)

func downgradeDamage():
	if damage > 1:
		get_parent().get_node("Buttons/SmallNumber3/Sprite").frame -= 1
		get_parent().get_node("Health").healthup(6)