extends Area2D

func _on_heavy_armor_B_body_entered(_body):
	$AnimatedSprite.play("attack")
	PlayerVariables.health -= 25
	yield(get_tree().create_timer(2.0), "timeout")
	#get_tree().change_scene("res://scenes & scripts/game-over/gameover.tscn")
	$AnimatedSprite.play("idle")
