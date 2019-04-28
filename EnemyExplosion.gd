extends Node2D

const HEALTH_BONUS = preload("res://HealthBonus.tscn")


func _process(delta):
	if !$AnimationPlayer.is_playing() and !$AudioStreamPlayer2D.playing:
		queue_free()
		
func love():
	var healthBonus = HEALTH_BONUS.instance()
	healthBonus.global_position = global_position
	get_parent().add_child(healthBonus)