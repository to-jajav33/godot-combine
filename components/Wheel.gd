extends Node2D


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	var count = 0;
	var childrenArr = $items.get_children();
	var distance = 260.0;
	for item in childrenArr:
		var rad = count * ((2 * PI) / float(childrenArr.size()))
		var pos = Vector2(cos(rad), sin(rad)).normalized() * distance;
		item.position = pos;
		count = count + 1;
		continue;
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
