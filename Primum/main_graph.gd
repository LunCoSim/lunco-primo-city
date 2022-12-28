extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var graph_edit = $"GraphEdit"

const InputNode = preload("res://componens/Input.tscn")
const OutputNode = preload("res://componens/Output.tscn")

const FileToSave = "user://graph.res"

var Steps: int = 0
var IsRunning: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	update_steps_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if IsRunning:
		Steps += 1
		update_steps_label()
	
	

#---------------

func add_node(node_class):
	var node = node_class.instance()
	graph_edit.add_child(node)

func update_steps_label():
	$CanvasLayer/Time/Time.text = str(Steps)
	
#---------------
#UI integration
	
func _on_add_output_pressed():
	add_node(InputNode)

func _on_Button2_pressed():
	add_node(OutputNode)


func _on_GraphEdit_connection_request(from, from_slot, to, to_slot):
	graph_edit.connect_node(from, from_slot, to, to_slot)

func _on_GraphEdit_disconnection_request(from, from_slot, to, to_slot):
	graph_edit.disconnect_node(from, from_slot, to, to_slot)


func _on_Start_pressed():
	IsRunning = true


func _on_Stop_pressed():
	IsRunning = false
	
#-----
func alert(val):
	print(val)



func save():
	save_data(FileToSave)

func load():
	load_data(FileToSave)
	
func save_data(file_name):
	var graph_data = GraphData.new()
	graph_data.connections = graph_edit.get_connection_list()
	for node in graph_edit.get_children():
		if node is GraphNode:
			var node_data = NodeData.new()
			node_data.name = node.name
			node_data.type = node.Type
			node_data.offset = node.offset
#			node_data.data = node.data
			graph_data.nodes.append(node_data)
	if ResourceSaver.save(file_name, graph_data) == OK:
		print("saved")
	else:
		alert("Error saving graph_data")

func load_data(file_name):
#	$c/Alert.dialog_text = "Error loading graph"
	if ResourceLoader.exists(file_name):
		var graph_data = ResourceLoader.load(file_name)
		if graph_data is GraphData:
			init_graph(graph_data)
			print("loaded")
		else:
			alert("Not graph data")
	else:
		alert("File not exists")

func init_graph(graph_data: GraphData):
	clear_graph()
	for node in graph_data.nodes:
		# Get new node from factory autoload (singleton)
		print(node.type)
			
		var gnode = null
		
		match node.type:
			"InputNode":
				gnode = InputNode.instance()
			"OutputNode":
				gnode = OutputNode.instance()
				
		gnode.offset = node.offset
		gnode.name = node.name
		graph_edit.add_child(gnode)
		
	for con in graph_data.connections:
		var _e = graph_edit.connect_node(con.from, con.from_port, con.to, con.to_port)

func clear_graph():
	graph_edit.clear_connections()
	var nodes = graph_edit.get_children()
	for node in nodes:
		if node is GraphNode:
			node.queue_free()


func get_connected(connections, node, port):
	var res = null
	for conn in connections:
		if (conn["to"] == node.name) and (conn["to_port"]==port):
			return conn
	return res
	
func _on_do_step():
	var connections = graph_edit.get_connection_list()
	
	for node in graph_edit.get_children():
		if node is GraphNode:
			if node.Type == "InputNode":
				pass
			elif node.Type == "OutputNode":
				for port in node.get_connection_input_count():
					print(port)
					var conn = get_connected(connections, node, port)
					print(conn)
					if conn:
						var src = graph_edit.get_node(conn["from"])
						print(src.get_node("LineEdit").text)
