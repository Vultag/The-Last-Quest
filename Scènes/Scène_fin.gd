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
	_display_text("[center]Bravo Voyageur, tu es parvenu à la fin de ta quête,")
	$Timer_text_2.start()


func _on_Timer_text_2_timeout():
	_display_text("[center]Le trésor que tu cherchais est maintenant à ta portée,")
	$Timer_text_3.start()


func _on_Timer_text_3_timeout():
	_display_text("[center]Prends-le et sois libre comme l’âme d’un poète,")
	$Timer_text_4.start()


func _on_Timer_text_4_timeout():
	_display_text("[center]Tu peux enfin reposer en paix.")
	$fin.start()


func _on_fin_timeout():
	$AnimationPlayer.play("étoiles")


func _on_AnimationPlayer_animation_finished(_anim_name):
	get_tree().change_scene("res://Scènes/MENU.tscn")
