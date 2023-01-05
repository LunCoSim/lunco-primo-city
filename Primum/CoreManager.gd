extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Resources
var money := 100
var oxygen := 100
var co2 := 0

var population := []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func tick():
	for person in population:
		oxygen -= person.oxygen_consumption
		co2 += person.co2_exhaust
