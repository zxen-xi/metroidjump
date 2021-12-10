extends KinematicBody2D
onready var AnimatedSprite = $AnimatedSprite
#^node declarations

#physics variables
export var move_speed = 550
export var gravity = 1500
export var jump_speed = 800
var velocity = Vector2.ZERO

#For health, load "PlayerVariables.health" to manipulate globally


#physics process called every 60 seconds
func _physics_process(delta):
	# reset horizontal velocity
	velocity.x = 0

	# set horizontal velocity
	if Input.is_action_pressed("right"):
		velocity.x += move_speed
		AnimatedSprite.play("run")
	elif Input.is_action_pressed("left"):
		velocity.x -= move_speed
		AnimatedSprite.play("run")
	elif Input.is_action_pressed("jump"):
		if is_on_floor():
			velocity.y = -jump_speed
			$"jump-sound".play()
	else:
		AnimatedSprite.play("idle")
	# apply gravity
	# player always has downward velocity
	velocity.y += gravity * delta
	
	
	# actually move the player
	velocity = move_and_slide(velocity, Vector2.UP)
	
	#direction flip
	if velocity.x > 0:
		AnimatedSprite.flip_h = false
	elif velocity.x < 0:
		AnimatedSprite.flip_h = true
	
	#healthbar manipulation
	$Healthbar.value = PlayerVariables.health
	$Healthbar.max_value = PlayerVariables.max_health
	if PlayerVariables.health == 0:
		get_tree().change_scene("res://scenes & scripts/game-over/gameover_hp.tscn")
	elif PlayerVariables.health == 75: #displaying value of health over bar
		$Healthbar/value_label.text = "75"
	elif PlayerVariables.health == 50:
		$Healthbar/value_label.text = "50"
	elif PlayerVariables.health == 25:
		$Healthbar/value_label.text = "25"
	
	$score.text = str("Score: ", PlayerVariables.score)
