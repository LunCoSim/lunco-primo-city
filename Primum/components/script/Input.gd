extends GNode
class_name InputNode

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const Type = "InputNode"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Input_gui_input(event):
	if event is InputEventMouseButton:
		if event.doubleclick:
			print(event.position)
			
	pass # Replace with function body.
