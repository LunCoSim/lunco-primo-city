extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

@export var Population := 10_000

@export var Steps := 4000
@export var StepSizeDays := 1 

#https://www.cnet.com/science/breathe-deep-how-the-iss-keeps-astronauts-alive/
@export var OxygenConsumption = 0.84 #kg/person/day

var paused = true

#----------

var OxygenConsumed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	init_output_table()
	
func init_output_table():
	var tree = $"UiLayer/TableOutput"
	tree.set_column_title(0, "Day")
	tree.set_column_title(1, "Oxygen Consumed")
	var root = tree.create_item()

	tree.set_hide_root(true)	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not paused:
		var tree = $"UiLayer/TableOutput"
		var root = tree.get_root()
		
		OxygenConsumed += Population*StepSizeDays*OxygenConsumption*(delta/1000)
		
		var child = tree.create_item(root)

		child.set_text(0, str((delta/1000)*StepSizeDays))
		child.set_text(1, str(OxygenConsumed))


func _on_Button_pressed():
	paused = not paused


func _on_Button2_pressed():
	$"GameLayer".scale.x = $"GameLayer".scale.x + 0.1
	$"GameLayer".scale.y = $"GameLayer".scale.y + 0.1


func _on_World_gui_input(event):
	pass

var moving = false

func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		var e = event as InputEventMouseButton
		
		moving = e.is_pressed()
	elif event is InputEventMouseMotion:
		var e = event as InputEventMouseMotion
		
		if moving:
#			e.relative
			$"GameLayer/World".position += e.relative
		else:
			pass
	elif event is InputEventPanGesture:
		var e = event as InputEventPanGesture
		var length = e.delta.y/10
		$"GameLayer".scale = $"GameLayer".scale+Vector2(length, length)
#
#
#		print(e.delta)
	else:
		print(event)
		
func on_edit_node_name(node):
	$"UiLayer/InputDialog".popup_centered()
