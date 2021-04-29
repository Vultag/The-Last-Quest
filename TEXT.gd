extends RichTextLabel


var fade =false

var add_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_visible_characters(0)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	"""
	if get_parent().name == "Scène_intro":
		$Timer.wait_time = 0.13
	else:
		$Timer.wait_time = 0.8
	"""
	
	if add_timer >= 6:
		fade = true
	
	if fade == true:
		self_modulate -= Color(0,0,0,0.001)
	else:
		self_modulate = Color(1,1,1,1)



func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	if get_total_character_count() <= get_visible_characters():
		add_timer += 1
