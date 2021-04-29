extends Node


var ghost_count = 0

var has_stick = false

var phase_2 = false

var fantome_1_off = false
var fantome_2_off = false
var fantome_3_off = false

var fantome_5_off = false
var fantome_6_off = false
var fantome_7_off = false
var fantome_8_off = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	
	if Input.is_action_just_pressed("echap"):
		get_tree().quit()
	
