extends Area2D

signal signal_clicked;

# Declare member variables here. Examples:
export(int) var id = -1;
var _gamestate : GameState;

var images = [
	load("res://images/Cloud.png"),
	load("res://images/Rainy.png"),
	load("res://images/Sunny.png"),
	load("res://images/Snowflake.png"),
];



# Called when the node enters the scene tree for the first time.
func _ready():
	var playerId = 1;
	_gamestate = get_node("/root/GameStateManager").getGameState(playerId);
	
	$Sprite.texture = images[self.id];
	
	$AnimationPlayer.play("default");
	
	self.connect("mouse_entered", self, "onMouseEntered");
	self.connect("mouse_exited", self, "onMouseExited");
	self.connect("signal_clicked", self, "onSignalClicked");
	pass # Replace with function body.

func _on_Item_input_event(_viewport : Viewport, event : InputEventMouse, _shape_idx):
	if (self._gamestate.canClickAgain()):
		if (event.is_action_released("gameplay_select")):
			emit_signal("signal_clicked", self.id);
			var _isCorrect = _gamestate.patternClicked(self.id);
	pass # Replace with function body.

func onMouseEntered():
	print("mouse entered")
	if (self._gamestate.canClickAgain()):
		print("mouse entered worked")
		$AnimationPlayer.play("scale");
	return;

func onMouseExited():
	if (self._gamestate.canClickAgain()):
		$AnimationPlayer.play("default");
	return;

func onSignalClicked(paramId):
	self.playClickedAnim();
	self._gamestate.patternClicked(paramId);
	return;

func playClickedAnim():
	$AnimationPlayer.play("clicked");
	return;
