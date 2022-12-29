extends GraphNode
class_name GNode

signal edit_node_name(node)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.doubleclick:
			print(event.position)
			self.emit_signal("edit_node_name", self)
	pass # Replace with function body.
