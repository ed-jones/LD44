extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$HealthBonusArea2D.connect("area_entered", self, "hit")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += 1


func hit(object):
	if object.name == 'PlayerArea2D':
		queue_free()
