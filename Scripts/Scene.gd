extends Node2D

var screen_size
export var speed = 400
const ENEMY1 = preload("res://Scenes/Enemy1.tscn")
const ENEMY2 = preload("res://Scenes/Enemy2.tscn")
const ENEMY3 = preload("res://Scenes/Enemy3.tscn")
const ENEMY4 = preload("res://Scenes/Enemy4.tscn")
const GAMEOVER = preload("res://Scenes/GameOver.tscn")
var enemyList = []
var i = 0.5
var index
var lastEnemy = ENEMY1.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	screen_size = get_viewport_rect().size
	randomize()
	
	lastEnemy.global_position = Vector2(-32, 64)
	enemyList.append(lastEnemy)
	add_child(lastEnemy)
	lastEnemy.speedUp(i)

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	if Input.is_action_pressed("ui_up"):
		$Player.fire()
	
	$Player.position += velocity * delta
	$Player.position.x = clamp($Player.position.x, 64, 536)
	if is_instance_valid(lastEnemy):
		if (lastEnemy.global_position.x > -32):
			var rand = randf()
			var enemy = ENEMY1.instance()
			
			if rand < 0.50:
				enemy = ENEMY1.instance()
			elif rand < 0.75:
				enemy = ENEMY2.instance()
			elif rand < 0.95:
				enemy = ENEMY3.instance()
			else:
				enemy = ENEMY4.instance()
			add_child(enemy)
			enemy.global_position = Vector2(-128, 64)
			enemyList.append(enemy)
			enemy.speedUp(i)
			if is_instance_valid(enemy):
				lastEnemy = enemy
	i+=0.001
	
	index = 0
	for enemy in enemyList:
		if is_instance_valid(enemy) and enemy.global_position:
			if abs(enemy.global_position.x - $Player.global_position.x) < 10:
				if enemy.has_method("fire"):
					enemy.fire()
		else:
			enemyList.remove(index)
		index+=1
		
	if $Health.getHealth() <= 0:
		gameOver()

func getSpeed():
	return i


func gameOver():
	var gameover = GAMEOVER.instance()
	add_child(gameover)
	gameover.global_position = Vector2(300, 300)
	for enemy in enemyList:
		if is_instance_valid(enemy):
			enemy.queue_free()
	
