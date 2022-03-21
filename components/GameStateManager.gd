extends Node


# Declare member variables here. Examples:
var _states = {};


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func getGameState(paramId = 1) -> GameState:
	var id = str(paramId);
	var state = self._states.get(id,  preload("res://components/GameState.tscn").instance());
	self._states[id] = state;
	return state;
