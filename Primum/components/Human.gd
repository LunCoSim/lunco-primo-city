extends GNode
class_name HumanNode

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#--------------------
#according to https://victorkarp.com/godot-engine-how-to-get-the-class-name-of-a-custom-class/
func get_class():
	return "HumanNode"

func is_class(value):
	return value == "HumanNode"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
