extends Area2D

func _on_fall_death_1_body_entered(body):
	get_tree().change_scene("res://scenes & scripts/game-over/gameover_fallen.tscn")
