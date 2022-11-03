extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var graph_edit = $"GraphEdit"

const InputNode = preload("res://componens/Input.tscn")
const OutputNode = preload("res://componens/Output.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func add_node(node_class):
	var node = node_class.instance()
	graph_edit.add_child(node)


#---------------
#UI integration
	
func _on_add_output_pressed():
	add_node(InputNode)

func _on_Button2_pressed():
	add_node(OutputNode)
