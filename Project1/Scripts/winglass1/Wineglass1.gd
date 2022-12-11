extends Node2D

var typeselected = 4
var selected = false
var rest_point
var rest_nodes = []

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[1].global_position
	rest_nodes[1].select()
	$AnimatedSprite.play("150mlwater")
	$water150.play()

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
		$honey150.stop()
		$honey300.stop()
		$water150.stop()
		$water300.stop()

	if typeselected == 1:
		$honey150.stop()
		$honey300.stop()
		$water150.stop()
		$water300.stop()
		$AnimatedSprite.play("150mlwater")
		$water150.play()
		
	if typeselected == 2:
		$honey150.stop()
		$honey300.stop()
		$water150.stop()
		$water300.stop()
		$AnimatedSprite.play("150mlhoney")
		$honey150.play()
		
	if typeselected == 3:
		$honey150.stop()
		$honey300.stop()
		$water150.stop()
		$water300.stop()
		$AnimatedSprite.play("300mlwater")
		$water300.play()
		
	if typeselected == 4:
		$honey150.stop()
		$honey300.stop()
		$water150.stop()
		$water300.stop()
		$AnimatedSprite.play("300mlhoney")
		$honey300.play()
