extends ConfirmationDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_input_data(data):
	$LineEdit.text = str(data)
	
func get_input_data():
	return $LineEdit.text
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
