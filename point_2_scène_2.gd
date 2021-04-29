extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse_in
var has_perso


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	
	if get_parent().get_node("Perso").global_position == global_position:
		has_perso = true
	else:
		has_perso = false
	
	if mouse_in == true:
		if Input.is_action_just_pressed("left_mouse") && has_perso == false:
			if get_parent().get_node("Perso").get_node("AnimationPlayer").is_playing() == false:
				get_parent().get_node("Perso").get_node("AnimationPlayer").play("départ2_to_milieu2")
				#$Timer.start()
				#has_perso = false
				#get_parent().get_node("point_1").has_perso = true


func _on_point_2_mouse_entered():
	mouse_in = true


func _on_point_2_mouse_exited():
	mouse_in = false
