extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
var move = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(_delta):
	
	if position.y < 820:
		scale.x = 2 + ((position.y - 820)/200)
		scale.y = 2 + ((position.y - 820)/200)
	else:
		scale.y = 2
		scale.x = 2
	
	if Input.is_action_pressed("z"):
		move.y = -30
		if !Input.is_action_pressed("q") && !Input.is_action_pressed("d"):
			$AnimatedSprite.play("walk_b")
	elif Input.is_action_pressed("s"):
		move.y = 30
		if !Input.is_action_pressed("q") && !Input.is_action_pressed("d"):
			$AnimatedSprite.play("walk_f")
	else:
		move.y = 0
	if Input.is_action_pressed("q"):
		move.x = -150
		$AnimatedSprite.play("walk_s")
	elif Input.is_action_pressed("d"):
		move.x = 150
		$AnimatedSprite.play("walk_s")
	else:
		move.x = 0
	
	if Input.is_action_just_pressed("d"):
		$AnimatedSprite.flip_h = false
		#if scale.x > 0 :
			#scale.x *= -1
	
	if Input.is_action_just_pressed("q"):
		$AnimatedSprite.flip_h = true
		#if scale.x < 0 :
			#scale.x *= -1
	
	if move.x == 0 && move.y == 0 :
		#$AnimatedSprite.frame = 1
		$AnimatedSprite.play("default")
	
	
	
	move = move_and_slide(move)
