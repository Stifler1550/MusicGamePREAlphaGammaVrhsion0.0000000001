extends Node2D

var typeselected = 4
var selected = false
var rest_point
var rest_nodes = []

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position
	rest_nodes[0].select()
	$AnimatedSprite.play("water50")
	$water50.play()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click"):
		selected = true

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
	else:
		global_position = lerp(global_position, rest_point, 10*delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 40
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
					child.select()
					rest_point = child.global_position
					shortest_dist = distance	


func _on_TextEdit_text_changed():
	typeselected = int($TextEdit.text)
	if typeselected == 0:
		$water50.stop()
		$water100.stop()
		$milk50.stop()
		$milk100.stop()

	if typeselected == 1:
		$water50.stop()
		$water100.stop()
		$milk50.stop()
		$milk100.stop()
		$AnimatedSprite.play("water50")
		$water50.play()
		
	if typeselected == 2:
		$water50.stop()
		$water100.stop()
		$milk50.stop()
		$milk100.stop()
		$AnimatedSprite.play("water100")
		$water100.play()
		
	if typeselected == 3:
		$water50.stop()
		$water100.stop()
		$milk50.stop()
		$milk100.stop()
		$AnimatedSprite.play("milk50")
		$milk50.play()
		
	if typeselected == 4:
		$water50.stop()
		$water100.stop()
		$milk50.stop()
		$milk100.stop()
		$AnimatedSprite.play("milk100")
		$milk100.play()
