extends Node2D


var jouer 
var quitter
var controles
var retour
var ctrl_menu = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _process(_delta):
	
	
	if jouer == true && ctrl_menu == false:
		#if Input.is_action_just_pressed("left_mouse"):
			if Input.is_action_just_released("left_mouse"):
				$AnimationPlayer.play("change_scène")
				$Timer.start()


	if quitter == true && ctrl_menu == false:
		#if Input.is_action_just_pressed("left_mouse"):
			if Input.is_action_just_released("left_mouse"):
				get_tree().quit()
	
	
	if controles == true && ctrl_menu == false:
		#if Input.is_action_just_pressed("left_mouse"):
			if Input.is_action_just_released("left_mouse"):
				$Sprite.play("ctrl")
				ctrl_menu = true
				$controles.visible = true
				$bout_retour.visible = true
				$bout_jouer.visible = false
				$bout_ctrl.visible = false
				$bout_quitter.visible = false
	
	
	if retour == true && ctrl_menu == true:
		if Input.is_action_just_released("left_mouse"):
			$Sprite.play("default")
			ctrl_menu = false
			$controles.visible = false
			$bout_retour.visible = false
			$bout_jouer.visible = true
			$bout_ctrl.visible = true
			controles = false
			retour = false
			$bout_ctrl.modulate = Color(1,1,1)
			$bout_quitter.visible = true


func _on_change_scne_timeout():
	get_tree().change_scene("res://Scènes/Scène_intro.tscn")




func _on_bout_jouer_mouse_entered():
	$bout_jouer.modulate = Color(0.7,0.7,0.7)
	jouer = true


func _on_bout_jouer_mouse_exited():
	$bout_jouer.modulate = Color(1,1,1)
	jouer = false


func _on_bout_ctrl_mouse_entered():
	$bout_ctrl.modulate = Color(0.7,0.7,0.7)
	controles = true


func _on_bout_ctrl_mouse_exited():
	$bout_ctrl.modulate = Color(1,1,1)
	controles = false


func _on_bout_quitter_mouse_entered():
	$bout_quitter.modulate = Color(0.7,0.7,0.7)
	quitter = true


func _on_bout_quitter_mouse_exited():
	$bout_quitter.modulate = Color(1,1,1)
	quitter = false


func _on_bout_retour_mouse_entered():
	$bout_retour.modulate = Color(0.7,0.7,0.7)
	retour = true


func _on_bout_retour_mouse_exited():
	$bout_retour.modulate = Color(1,1,1)
	retour = false







