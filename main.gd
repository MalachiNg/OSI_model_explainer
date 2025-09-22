extends CharacterBody2D

var intro_page_scale : float = float(0.55)
var layer_1_scale : float = float(2.5)
var layer_2_scale : float = float(12.5)
var layer_3_scale : float = float(62.5)
var layer_4_scale : float = float(312.5)
var layer_5_scale : float = float(1562.5)
var layer_6_scale : float = float(7812.5)
var layer_7_scale : float = float(39062.5)
var scalar_x : float = float(1.0)
var scalar : float = float(1.0)
var scroll_speed : float
var scalar_x_increaser : float


func _process(_delta):
	scroll()
	calculate_scalar()
	manage_scales()
	show_corny_ass_acronym()
	scroll_in()
	scroll_out()
	
func calculate_scalar():
	scalar = (5*pow(2.71828183, (-1.609*scalar_x)))

func manage_scales():
	$intro_page_Sprite2D.scale = Vector2((intro_page_scale*scalar), (intro_page_scale*scalar))
	$layer_1_Sprite2D.scale = Vector2((layer_1_scale*scalar), (layer_1_scale*scalar))
	$layer_2_Sprite2D.scale = Vector2((layer_2_scale*scalar), (layer_2_scale*scalar))
	$layer_3_Sprite2D.scale = Vector2((layer_3_scale*scalar), (layer_3_scale*scalar))
	$layer_4_Sprite2D.scale = Vector2((layer_4_scale*scalar), (layer_4_scale*scalar))
	$layer_5_Sprite2D.scale = Vector2((layer_5_scale*scalar), (layer_5_scale*scalar))
	$layer_6_Sprite2D.scale = Vector2((layer_6_scale*scalar), (layer_6_scale*scalar))
	$layer_7_Sprite2D.scale = Vector2((layer_7_scale*scalar), (layer_7_scale*scalar))

func show_corny_ass_acronym():
	if scalar_x > 8.37:
		$OSI_names_Sprite2D.show()
		$OSI_acronym_Sprite2D.show()
	else:
		$OSI_names_Sprite2D.hide()
		$OSI_acronym_Sprite2D.hide()

func scroll():
	scroll_speed = (get_global_mouse_position().y - 324)
	scalar_x_increaser = ((scroll_speed-6.83)/9871.72)
	if abs(scroll_speed) < 20:
		scalar_x_increaser = 0
	if scroll_speed > 0 and (scalar_x+scalar_x_increaser) < 8.379:
		scalar_x += scalar_x_increaser
	elif scroll_speed < 0 and (scalar_x+scalar_x_increaser) > 1:
		scalar_x += scalar_x_increaser

func scroll_in():
	if Input.is_action_pressed("scroll_in"):
		if scalar_x > 1:
			scalar_x -= 0.01

func scroll_out():
	if Input.is_action_pressed("scroll_out"):
		if scalar_x < 8.3:
			scalar_x += 0.01
