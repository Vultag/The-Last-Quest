extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouse_in_1

var perso_point = 1

var porte_ouverte = false
var cache_open = false
var has_key = false

var in_zone_1 = false
var in_zone_2 = false
var in_zone_3 = false
var in_zone_cache = false
var in_zone_porte = false

var fade


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimDebut.play("AnimDebut")
	_display_text("[center]C'est dans cette grotte que ma quête doit se terminer...")
	get_node("TEXT").get_node("Timer").wait_time = 0.08
	#$AudioStreamPlayer2D.play()
	$AnimLumiereGrotte.play("LumiereGrotteScintille")


func _process(_delta):
	
	if fade == true:
		$AnimLumiereGrotte.play("GrotteActive")
		$AnimFIN.play("AnimFIN")
		pass
		#$ColorRect.color += Color(0,0,0,0.0005)
		#$ColorRect.visible = true
	
	if $ColorRect.color == Color(0,0,0,0):
		#$change_scene_timer.start()
		pass
	
	
	if get_node("pillier_1").animation == "2" && get_node("pillier_2").animation == "5" && get_node("pillier_3").animation == "1" :
		$cache.get_node("AnimationPlayer").play("open")
		cache_open = true
	
	
	


func _on_change_scene_timer_timeout():
	get_tree().change_scene("res://Scènes/Scène_2.tscn")


func _on_AnimationPlayer_animation_finished(_anim_name):
	get_node("Perso").get_node("AnimatedSprite").play("default")





func _on_Button_1_pressed():
	if in_zone_1 == true && cache_open == false:
		if get_node("pillier_1").animation == "1":
			get_node("pillier_1").play("2")
			#return
		elif get_node("pillier_1").animation == "2":
			get_node("pillier_1").play("3")
			#return
		elif get_node("pillier_1").animation == "3":
			get_node("pillier_1").play("4")
		elif get_node("pillier_1").animation == "4":
			get_node("pillier_1").play("5")
		elif get_node("pillier_1").animation == "5":
			get_node("pillier_1").play("1")
			#return


func _on_Button_2_pressed():
	if in_zone_2 == true && cache_open == false:
		if get_node("pillier_2").animation == "1":
			get_node("pillier_2").play("2")
			#return
		elif get_node("pillier_2").animation == "2":
			get_node("pillier_2").play("3")
			#return
		elif get_node("pillier_2").animation == "3":
			get_node("pillier_2").play("4")
		elif get_node("pillier_2").animation == "4":
			get_node("pillier_2").play("5")
		elif get_node("pillier_2").animation == "5":
			get_node("pillier_2").play("1")


func _on_Button_3_pressed():
	if in_zone_3 == true && cache_open == false:
		if get_node("pillier_3").animation == "1":
			get_node("pillier_3").play("2")
			#return
		elif get_node("pillier_3").animation == "2":
			get_node("pillier_3").play("3")
			#return
		elif get_node("pillier_3").animation == "3":
			get_node("pillier_3").play("4")
		elif get_node("pillier_3").animation == "4":
			get_node("pillier_3").play("5")
		elif get_node("pillier_3").animation == "5":
			get_node("pillier_3").play("1")


func _on_zone_1_body_entered(_body):
	in_zone_1 = true


func _on_zone_2_body_entered(_body):
	in_zone_2 = true


func _on_zone_3_body_entered(_body):
	in_zone_3 = true


func _on_zone_1_body_exited(_body):
	in_zone_1 = false


func _on_zone_2_body_exited(_body):
	in_zone_2 = false


func _on_zone_3_body_exited(_body):
	in_zone_3 = false


func _on_zone_cache_body_entered(_body):
	in_zone_cache = true


func _on_zone_cache_body_exited(_body):
	in_zone_cache = false


func _on_Button_pressed():
	if in_zone_cache == true && cache_open == true:
		$cache.play("empty")
		has_key = true
		_display_text("[center]C'est ce qui me fallait!")
		$INVENTAIRE.self_modulate = Color(1,1,1,1)
		$INVENTAIRE.play("key")
		$cache/Button.disabled = true
		


func _on_enter_cave_body_entered(_body):
	$change_scene_timer.start()
	fade = true


func _display_text(text):
	$TEXT.set_bbcode(text) 
	$TEXT/Timer.start()
	$TEXT.fade = false
	$TEXT.add_timer = 0
	$TEXT.set_visible_characters(0)




func _on_Button_DOOR_pressed():
	if in_zone_porte == true:
		_display_text("[center]C'est fermé.")


func _on_zone_porte_body_entered(_body):
	in_zone_porte = true


func _on_zone_porte_body_exited(_body):
	in_zone_porte = false


func _on_Button_inv2_pressed():
	if in_zone_porte == true && has_key == true:
		$MUR.get_node("PORTE_block").disabled = true
		$DOOR.play("open")
		$AnimLumiereGrotte.play("GrotteActive")
	elif has_key == true && in_zone_porte == false:
		_display_text("[center]ça n'a pas d'utilité ici")
	else:
		_display_text("[center]Je n'ai rien dans mon inventaire")











func _on_son_foret_finished():
	$son_foret.play()


