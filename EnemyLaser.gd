extends Node2D

var VELOCITY = Vector2(0, -150)

func init(velocity):
	VELOCITY = velocity

func _process(delta):
    move(delta)
    removeWhenOffScreen()

func move(delta):
    global_position += VELOCITY * delta

func removeWhenOffScreen():
    if global_position.y < 0:
        queue_free()

func _ready():
    $BulletArea2D.connect("area_entered", self, "hit")

func hit(object):
    if object.name == 'PlayerArea2D':
        queue_free()