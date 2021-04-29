extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse_in
var switch = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("left_mouse"):
			if mouse_in == true:
				if switch == false:
					get_parent().get_node("Sprite").visible = true
					switch = true
				elif switch == true:
					get_parent().get_node("Sprite").visible = false
					switch = false
				
				


func _on_interruptor_mouse_entered():
	mouse_in = true


func _on_interruptor_mouse_exited():
	mouse_in = false
