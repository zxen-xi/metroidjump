extends KinematicBody2D

export var move_speed = 550
export var gravity = 1500

onready var AnimatedSprite = $AnimatedSprite

export var jump_speed = 800

var velocity = Vector2.ZERO

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

	if velocity.y > 1500:
		get_tree().change_scene("res://scenes & scripts/game-over/gameover.tscn")
	# actually move the player
	velocity = move_and_slide(velocity, Vector2.UP)
	
	#direction flip
	if velocity.x > 0:
		AnimatedSprite.flip_h = false
	elif velocity.x < 0:
		AnimatedSprite.flip_h = true
