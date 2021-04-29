extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$img.self_modulate = Color(1,1,1,1)
	$img.play("début")
	$AnimationPlayer.play("off")
	get_node("TEXT").get_node("Timer").wait_time = 0.13


func _process(_delta):
	pass



func _display_text(text):
	$TEXT.set_bbcode(text) 
	$TEXT/Timer.start()
	$TEXT.fade = false
	$TEXT.add_timer = 0
	$TEXT.set_visible_characters(0)


func _on_Timer_start_timeout():
	_display_text("[center]Voyageur à la recherche du Graal,")
	$Timer_text_2.start()


func _on_Timer_text_2_timeout():
	_display_text("[center]Arrivé au terme de ton voyage,")
	$Timer_text_3.start()


func _on_Timer_text_3_timeout():
	_display_text("[center]Affronte l’ultime épreuve de ce passage,")
	$Timer_text_4.start()


func _on_Timer_text_4_timeout():
	_display_text("[center]Et rapporte le trésor vers ta Terre natale.")
	$fin.start()


func _on_fin_timeout():
	$AnimationPlayer.play("fin")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scènes/Scène_1.tscn")
