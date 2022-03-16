extends Area2D


# Declare member variables here. Examples:
var id = -1;
var _gamestate : GameState;


# Called when the node enters the scene tree for the first time.
func _ready():
	var playerId = 1;
	_gamestate = get_node("/root/GameStateManager").getGameState(playerId);
	pass # Replace with function body.


func _on_Item_input_event(_viewport : Viewport, event : InputEventMouse, _shape_idx):
	if (_gamestate.canClickAgain()):
		if (event.is_action_released("gameplay_select")):
			var _isCorrect = _gamestate.patternClicked(self.id);
	pass # Replace with function body.
