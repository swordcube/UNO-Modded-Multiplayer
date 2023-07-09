extends Node2D

@onready var buttons = $Buttons
@onready var selected = $Selected

var cur_selected:int = 0

func _process(delta):
	selected.scale.y = lerpf(selected.scale.y, 1.0, delta * 6)
	
	if Input.is_action_just_pressed("ui_up"):
		change_selected(cur_selected - 1)
	elif Input.is_action_just_pressed("ui_down"):
		change_selected(cur_selected + 1)
	elif Input.is_action_just_pressed("ui_accept"):
		select_thing()

func change_selected(new_selected:int):
	if (cur_selected == new_selected):
		return
	
	cur_selected = wrapi(new_selected, 0, buttons.get_child_count())
	
	selected.position.y = buttons.position.y + buttons.get_child(cur_selected).position.y
	selected.scale.y = 0.01
	
func select_thing():
	print(cur_selected)

func _area_input(viewport, event, shape_idx, extra_arg_0):
	if event is InputEventMouseButton and event.button_index == 1 and event.pressed:
		cur_selected = extra_arg_0
		select_thing()
