extends Area2D

func _on_ghost_warrior_C_body_entered(body):
	$AnimatedSprite.play("attack")
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().change_scene("res://scenes & scripts/game-over/gameover.tscn")
	$AnimatedSprite.play("idle")
