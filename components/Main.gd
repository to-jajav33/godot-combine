extends Node2D


# Declare member variables here. Examples:
var _gameState;


# Called when the node enters the scene tree for the first time.
func _ready():
	var id = 1;
	_gameState = get_node("/root/GameStateManager").getGameState(id);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
