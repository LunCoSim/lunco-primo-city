@tool
extends Control
class_name Building

@export var In = []
@export var Out = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

@export var type := "Building"

# Called when the node enters the scene tree for the first time.
func _ready():
	print('ready')
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text(type)
	

#-------------------------------

func draw_circle_arc(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PackedVector2Array()

	for i in range(nb_points + 1):
		var angle_point = deg_to_rad(angle_from + i * (angle_to-angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)

	for index_point in range(nb_points):
		draw_line(points_arc[index_point], points_arc[index_point + 1], color)
