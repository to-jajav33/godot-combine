extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var prnt : Area2D = get_parent();
	var _result = prnt.connect("mouse_entered", self, "_onMouseEntered");
	_result = prnt.connect("mouse_exited", self, "_onMouseLeave");
	pass # Replace with function body.

func _onMouseEntered():
	print("mouse entered")
	$AnimationPlayerItem.play("scale");
	return;

func _onMouseLeave():
	print("mouse leave")
	$AnimationPlayerItem.play("default");
	return;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
