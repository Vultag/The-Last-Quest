extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var in_zone_1 = false
var in_zone_2 = false
var in_zone_3 = false
var in_zone_4 = false
var in_zone_5 = false

var disp_text = true

var fade_in = true

var fade_out


func _ready():
	
	#_display_text("[wave][center]Qu'est-ce qui m'arrive ???")


	$AnimEtoile2.play("AnimEtoiles")
	$AnimLumiere.play("AnimLumiere")
	
	if globals.has_stick == true:
		$INVENTAIRE/stick.visible = true
		$INVENTAIRE.self_modulate = Color(1,1,1,1)
	
	
	
	if globals.fantome_5_off == true:
		$Fantome2/Button_2.disabled = true
		$Fantome2.play("off")
	if globals.fantome_6_off == true:
		$Fantome3/zone_3/CollisionShape2D.disabled = true
		in_zone_3 = false
		$Fantome3.play("off")
	if globals.fantome_7_off == true:
		$Fantome4/Button_4.disabled = true
		$Fantome4.play("off")
	if globals.fantome_8_off == true:
		$Fantome5/zone_5/CollisionShape2D.disabled = true
		in_zone_5 = false
		$Fantome5.play("off")
	
	
	globals.phase_2 = true
	
	
	pass


func _process(_delta):
	
	
	$Fantome_count/Label.set_text(str(globals.ghost_count)+"/7")
	
	if globals.ghost_count == 7:
		if disp_text == true:
			_display_text("[wave][center]Qu'est-ce qui m'arrive ? Je... Je me sens bien !")
			disp_text = false
		$AnimLumiere.play("LuluFIN")
		$stick/AnimationPlayer.play("use_sea")
		$stick.visible = false
		$AnimLAFIN.play("AnimLAFIN")
	
		
		
	
	pass



func _on_Timer_timeout():
	fade_out = true


func _on_enter_scne_2_body_entered(_body):
	get_tree().change_scene("res://Scènes/Scène_2.tscn")


func _on_zone_2_body_entered(_body):
	in_zone_2 = true

func _on_zone_2_body_exited(_body):
	in_zone_2 = false

func _on_zone_3_body_entered(_body):
	in_zone_3 = true

func _on_zone_3_body_exited(_body):
	in_zone_3 = false

func _on_zone_4_body_entered(_body):
	in_zone_4 = true

func _on_zone_4_body_exited(_body):
	in_zone_4 = false

func _on_zone_5_body_entered(_body):
	in_zone_5 = true

func _on_zone_5_body_exited(_body):
	in_zone_5 = false




func _on_Button_2_pressed():
	if in_zone_2 == true:
		globals.ghost_count += 1
		globals.fantome_5_off = true
		$Fantome2/Button_2.disabled = true
		$Fantome2.play("off")


func _on_Button_3_pressed():
	if in_zone_3:
		_display_text("[wave][center]C'est trop loin!")


func _on_Button_4_pressed():
	if in_zone_4 == true:
		globals.ghost_count += 1
		globals.fantome_7_off = true
		$Fantome4/Button_4.disabled = true
		$Fantome4.play("off")

func _on_Button_inv2_pressed():
	if in_zone_5 == true && globals.has_stick:
		$stick.visible = true
		$stick/AnimationPlayer.play("use")
	elif in_zone_3 == true && globals.has_stick:
		$stick.visible = true
		$stick/AnimationPlayer.play("use_sea")
	elif globals.has_stick && !in_zone_3 && !in_zone_5:
		_display_text("[wave][center]ça n'a pas d'utilité ici")
	else:
		_display_text("[wave][center]Je n'ai rien dans mon inventaire")



func _on_AnimationPlayer_animation_finished(anim):
	if anim == "use":
		$stick.visible = false
		$stick/AnimationPlayer.play("off")
		if $Fantome5.animation == "default":
			globals.ghost_count += 1
			globals.fantome_8_off = true
		#$INVENTAIRE/Button_inv2.disabled = true
		$Fantome5.play("off")
		$Fantome5/zone_5/CollisionShape2D.disabled = true
		in_zone_5 = false
	if anim == "use_sea":
		$stick.visible = false
		$stick/AnimationPlayer.play("off")
		if $Fantome3.animation == "default":
			globals.ghost_count += 1
			globals.fantome_6_off = true
		$Fantome3/zone_3/CollisionShape2D.disabled = true
		in_zone_3 = false
		#$INVENTAIRE/Button_inv2.disabled = true
		$Fantome3.play("off")

func _display_text(text):
	$TEXT.set_bbcode(text) 
	$TEXT/Timer.start()
	$TEXT.fade = false
	$TEXT.add_timer = 0
	$TEXT.set_visible_characters(0)


func _on_Button_pressed():
	if in_zone_5:
		_display_text("[wave][center]C'est trop haut!")


func _on_AnimLAFIN_animation_finished(_anim_name):
	get_tree().change_scene("res://Scènes/Scène_fin.tscn")
