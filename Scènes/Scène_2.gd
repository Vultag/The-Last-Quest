extends Node2D


#onready var globals = get_node("res://globals.gd")

var in_zone_1 = false
var in_zone_2 = false
var in_zone_3 = false
var in_zone_stick = false

var fade = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$AnimBrouillard.play("AnimBrouillard")
	$AnimEtoiles.play("AnimEtoiles")
	$AnimFleurs.play("AnimFleurs")
	
	
	
	if globals.phase_2 == false:
		$Perso2.position = Vector2(233,640)
		$AnimDebut2.play("AnimDebut")
		_display_text("[wave][center]Où suis-je?")
	else:
		$Perso2.position = Vector2(1750,700)
		$Perso2/AnimatedSprite.flip_h = true
	
	if globals.has_stick == true:
		$INVENTAIRE/stick.visible = true
		$stick.visible = false
		$INVENTAIRE.self_modulate = Color(1,1,1,1)
	
	pass




func _process(_delta):
	
	if fade == true:
		$ColorRect.color += Color(0,0,0,0.0005)
		$ColorRect.visible = true
	
	if globals.fantome_1_off == true:
		$Fantome1/Button_1.disabled = true
		$Fantome1.play("off")
	if globals.fantome_2_off == true:
		$Fantome2/Button_2.disabled = true
		$Fantome2.play("off")
	if globals.fantome_3_off == true:
		$INVENTAIRE/Button_inv2.disabled = true
		$Fantome3.play("off")
	
	$Fantome_count/Label.set_text(str(globals.ghost_count)+"/7")
	
	if globals.ghost_count == 1:
		_display_text("[wave][center]Je me sens... Moins vide !")
	pass




func _on_Button_1_pressed():
	if in_zone_1 == true:
		globals.ghost_count += 1
		globals.fantome_1_off = true
		$Fantome1/Button_1.disabled = true
		$Fantome1.play("off")


func _on_Button_2_pressed():
	if in_zone_2 == true:
		globals.ghost_count += 1
		globals.fantome_2_off = true
		$Fantome2/Button_2.disabled = true
		#$Fantome2.play("off")
		$PathF1/FuiteF1.play("PathF1")
		$PathF1/PathFollowF1/Fa.play("default")



func _on_stick_button_pressed():
	if in_zone_stick == true:
		_display_text("[wave][center]Ça pourra être utile!")
		$INVENTAIRE/stick.visible = true
		$stick.visible = false
		globals.has_stick = true
		$INVENTAIRE.self_modulate = Color(1,1,1,1)
		$stick_button.disabled = true


func _on_Button_inv2_pressed():
	
	if in_zone_3 == true && globals.has_stick:
		$stick.visible = true
		$stick/AnimationPlayer.play("use")
	elif globals.has_stick && !in_zone_3:
		_display_text("[wave][center]ça n'a pas d'utilité ici")
	else:
		_display_text("[wave][center]Je n'ai rien dans mon inventaire")



func _on_zone_1_body_entered(_body):
	in_zone_1= true

func _on_zone_1_body_exited(_body):
	in_zone_1= false

func _on_zone_2_body_entered(_body):
	in_zone_2= true

func _on_zone_2_body_exited(_body):
	in_zone_2= false

func _on_zone_3_body_entered(_body):
	in_zone_3= true

func _on_zone_3_body_exited(_body):
	in_zone_3= false

func _on_zone_stick_body_entered(_body):
	in_zone_stick= true

func _on_zone_stick_body_exited(_body):
	in_zone_stick= false


func _on_AnimationPlayer_animation_finished(_use):
	$stick.visible = false
	$stick/AnimationPlayer.play("default")
	if $Fantome3.animation == "default":
		globals.ghost_count += 1
		globals.fantome_3_off = true
	$INVENTAIRE/Button_inv2.disabled = true
	$Fantome3.play("off")


func _on_enter_scne_3_body_entered(_body):
	get_tree().change_scene("res://Scènes/Scène_3.tscn")


func _display_text(text):
	$TEXT.set_bbcode(text) 
	$TEXT/Timer.start()
	$TEXT.fade = false
	$TEXT.add_timer = 0
	$TEXT.set_visible_characters(0)


func _on_Button_pressed():
	if in_zone_3:
		_display_text("[wave][center]C'est trop haut!")
		
