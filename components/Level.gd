extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _gameState: GameState;

# Called when the node enters the scene tree for the first time.
func _ready():
	self._gameState = $"/root/GameStateManager".getGameState();
	self._gameState.addNewPattern();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


