extends Node2D

func _on_mainmenu_pressed():
	get_tree().change_scene("res://scenes & scripts/game-start/gamestart.tscn")
	PlayerVariables.health = 75 #this sets health to original so we can play again

func _physics_process(delta):
	$score.text = str("Score: ", PlayerVariables.score)

