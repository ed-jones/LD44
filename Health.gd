extends Node2D

var health = 5

func _ready():
	pass # Replace with function body.

func damage(n=1):
	for i in n:
		if health > 0:
			health-=1
	
func healthup(n=1):
	for i in n:
		if health < 10:
			health+=1
			
func getHealth():
	return health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health >= 1:
		$Heart.modulate.a = 1
	else:
		$Heart.modulate.a = 0
	
	if health >= 2:
		$Heart2.modulate.a = 1
	else:
		$Heart2.modulate.a = 0
		
	if health >= 3:
		$Heart3.modulate.a = 1
	else:
		$Heart3.modulate.a = 0
		
	if health >= 4:
		$Heart4.modulate.a = 1
	else:
		$Heart4.modulate.a = 0
		
	if health >= 5:
		$Heart5.modulate.a = 1
	else:
		$Heart5.modulate.a = 0
		
	if health >= 6:
		$Heart6.modulate.a = 1
	else:
		$Heart6.modulate.a = 0
		
	if health >= 7:
		$Heart7.modulate.a = 1
	else:
		$Heart7.modulate.a = 0
		
	if health >= 8:
		$Heart8.modulate.a = 1
	else:
		$Heart8.modulate.a = 0
		
	if health >= 9:
		$Heart9.modulate.a = 1
	else:
		$Heart9.modulate.a = 0
		
	if health >= 10:
		$Heart10.modulate.a = 1
	else:
		$Heart10.modulate.a = 0