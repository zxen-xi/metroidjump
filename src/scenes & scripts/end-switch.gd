extends Area2D

func _on_endswitch_body_entered(body):
	get_tree().change_scene("res://scenes & scripts/end.tscn")
